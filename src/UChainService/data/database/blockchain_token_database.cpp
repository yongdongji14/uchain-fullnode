/**
 * Copyright (c) 2018-2020 UChain core developers (check UC-AUTHORS)
 *
 * This file is part of UChain.
 *
 * UChain is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License with
 * additional permissions to the one published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version. For more information see LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include <UChainService/data/databases/blockchain_token_database.hpp>

#include <cstddef>
#include <cstdint>
#include <memory>
#include <boost/filesystem.hpp>
#include <UChain/bitcoin.hpp>
#include <UChain/database/memory/memory.hpp>

namespace libbitcoin {
namespace database {

using namespace boost::filesystem;

//BC_CONSTEXPR size_t number_buckets = 999997;
BC_CONSTEXPR size_t number_buckets = 9997;
BC_CONSTEXPR size_t header_size = slab_hash_table_header_size(number_buckets);
BC_CONSTEXPR size_t initial_map_file_size = header_size + minimum_slabs_size;

blockchain_token_database::blockchain_token_database(const path& map_filename,
    std::shared_ptr<shared_mutex> mutex)
  : lookup_file_(map_filename, mutex),
    lookup_header_(lookup_file_, number_buckets),
    lookup_manager_(lookup_file_, header_size),
    lookup_map_(lookup_header_, lookup_manager_)
{
}

// Close does not call stop because there is no way to detect thread join.
blockchain_token_database::~blockchain_token_database()
{
    close();
}

// Create.
// ----------------------------------------------------------------------------

// Initialize files and start.
bool blockchain_token_database::create()
{
    // Resize and create require a started file.
    if (!lookup_file_.start())
        return false;

    // This will throw if insufficient disk space.
    lookup_file_.resize(initial_map_file_size);

    if (!lookup_header_.create() ||
        !lookup_manager_.create())
        return false;

    // Should not call start after create, already started.
    return
        lookup_header_.start() &&
        lookup_manager_.start();
}

// Startup and shutdown.
// ----------------------------------------------------------------------------

// Start files and primitives.
bool blockchain_token_database::start()
{
    return
        lookup_file_.start() &&
        lookup_header_.start() &&
        lookup_manager_.start();
}

// Stop files.
bool blockchain_token_database::stop()
{
    return lookup_file_.stop();
}

// Close files.
bool blockchain_token_database::close()
{
    return lookup_file_.close();
}

// ----------------------------------------------------------------------------

void blockchain_token_database::remove(const hash_digest& hash)
{
    DEBUG_ONLY(bool success =) lookup_map_.unlink(hash);
    BITCOIN_ASSERT(success);
}

void blockchain_token_database::sync()
{
    lookup_manager_.sync();
}

std::shared_ptr<blockchain_token> blockchain_token_database::get(const hash_digest& hash) const
{
    std::shared_ptr<blockchain_token> detail(nullptr);

    const auto raw_memory = lookup_map_.rfind(hash);
    if(raw_memory) {
        const auto memory = REMAP_ADDRESS(raw_memory);
        detail = std::make_shared<blockchain_token>();
        auto deserial = make_deserializer_unsafe(memory);
        detail->from_data(deserial);
    }

    return detail;
}

uint64_t blockchain_token_database::get_token_volume(const std::string& name) const
{
    uint64_t volume = 0;
    const auto hash = sha256_hash(data_chunk(name.begin(), name.end()));
    auto memo = lookup_map_.finds(hash);
    const auto action = [&](memory_ptr elem)
    {
        const auto memory = REMAP_ADDRESS(elem);
        auto deserial = make_deserializer_unsafe(memory);
        auto& token = blockchain_token::factory_from_data(deserial).get_token();
        volume += token.get_maximum_supply();
    };
    std::for_each(memo.begin(), memo.end(), action);

    return volume;
}

///
std::shared_ptr<std::vector<blockchain_token>> blockchain_token_database::get_blockchain_tokens(const std::string& token_symbol) const
{
    if (!token_symbol.empty()) {
        return get_token_history(token_symbol);
    }

    auto vec_acc = std::make_shared<std::vector<blockchain_token>>();
    uint64_t i = 0;
    for( i = 0; i < number_buckets; i++ ) {
        auto memo = lookup_map_.find(i);
        //log::debug("get_wallets size=")<<memo->size();
        if (memo->size()) {
            const auto action = [&](memory_ptr elem)
            {
                const auto memory = REMAP_ADDRESS(elem);
                auto deserial = make_deserializer_unsafe(memory);
                vec_acc->push_back(blockchain_token::factory_from_data(deserial));
            };
            std::for_each(memo->begin(), memo->end(), action);
        }
    }
    return vec_acc;
}

/// 
std::shared_ptr<blockchain_token::list> blockchain_token_database::get_token_history(const std::string & token_symbol) const
{
    std::shared_ptr<blockchain_token::list> blockchain_token_ = std::make_shared<blockchain_token::list>();
    data_chunk data(token_symbol.begin(), token_symbol.end());
    auto key = sha256_hash(data);

    auto token_vec = lookup_map_.finds(key);
    for(auto memo : token_vec){
        if(memo)
        {
            const auto memory = REMAP_ADDRESS(memo);
            auto deserial = make_deserializer_unsafe(memory);        
            blockchain_token_->emplace_back(blockchain_token::factory_from_data(deserial));
        }
    }

    return blockchain_token_;
}

/// 
std::shared_ptr<blockchain_token> blockchain_token_database::get_register_history(const std::string & token_symbol) const
{
    std::shared_ptr<blockchain_token> blockchain_token_ = nullptr;
    data_chunk data(token_symbol.begin(), token_symbol.end());
    auto key = sha256_hash(data);

    auto memo = lookup_map_.rfind(key);
    if(memo)
    {
        blockchain_token_ = std::make_shared<blockchain_token>();
        const auto memory = REMAP_ADDRESS(memo);
        auto deserial = make_deserializer_unsafe(memory);
        blockchain_token_->from_data(deserial);
    }

    return blockchain_token_;
}

///
uint64_t blockchain_token_database::get_register_height(const std::string & token_symbol) const
{
    std::shared_ptr<blockchain_token> blockchain_token_ = get_register_history(token_symbol);
    if(blockchain_token_)
        return blockchain_token_->get_height();
    return max_uint64;
}

void blockchain_token_database::store(const hash_digest& hash, const blockchain_token& sp_detail)
{
    // Write block data.
    const auto key = hash;
    const auto sp_size = sp_detail.serialized_size();
#ifdef UC_DEBUG
    log::debug("token_database::store") << sp_detail.to_string();
#endif
    BITCOIN_ASSERT(sp_size <= max_size_t);
    const auto value_size = static_cast<size_t>(sp_size);

    auto write = [&sp_detail](memory_ptr data)
    {
        auto serial = make_serializer(REMAP_ADDRESS(data));
        serial.write_data(sp_detail.to_data());
    };
    lookup_map_.store(key, write, value_size);
}


} // namespace database
} // namespace libbitcoin
