/**
 * Copyright (c) 2018-2020 UChain core developers (check UC-AUTHORS)
 *
 * This file is part of UChain-api.
 *
 * UChain-explorer is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License with
 * additional permissions to the one published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version. For more information see LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */


#pragma once
#include <UChain/explorer/define.hpp>
#include <UChainService/api/command/command_extension.hpp>
#include <UChainService/api/command/command_extension_func.hpp>
#include <UChainService/api/command/command_assistant.hpp>

namespace libbitcoin {
namespace explorer {
namespace commands {


/************************ deletemultisigaddress *************************/

class deletemultisigaddress: public command_extension
{
public:
    static const char* symbol(){ return "deletemultisigaddress";}
    const char* name() override { return symbol();}
    bool category(int bs) override { return (ctgy_extension & bs ) == bs; }
    const char* description() override { return "deletemultisigaddress "; }

    arguments_metadata& load_arguments() override
    {
        return get_argument_metadata()
            .add("WALLETNAME", 1)
            .add("WALLETAUTH", 1)
            .add("ADDRESS", 1);
    }

    void load_fallbacks (std::istream& input,
        po::variables_map& variables) override
    {
        const auto raw = requires_raw_input();
        load_input(auth_.name, "WALLETNAME", variables, input, raw);
        load_input(auth_.auth, "WALLETAUTH", variables, input, raw);
        load_input(option_.address, "ADDRESS", variables, input, raw);
    }

    options_metadata& load_options() override
    {
        using namespace po;
        options_description& options = get_option_metadata();
        options.add_options()
        (
            BX_HELP_VARIABLE ",h",
            value<bool>()->zero_tokens(),
            "Get a description and instructions for this command."
        )
        (
            "WALLETNAME",
            value<std::string>(&auth_.name)->required(),
            BX_WALLET_NAME
        )
        (
            "WALLETAUTH",
            value<std::string>(&auth_.auth)->required(),
            BX_WALLET_AUTH
        )
        (
            "ADDRESS",
            value<std::string>(&option_.address)->required(),
            "The multisig script corresponding address."
        )
        ;

        return options;
    }

    void set_defaults_from_config (po::variables_map& variables) override
    {
    }

    console_result invoke (Json::Value& jv_output,
         libbitcoin::server::server_node& node) override;

    struct argument
    {
        argument()
        {
        }
    } argument_;

    struct option
    {
        option()
          : address(""), m(0), n(0), index(0)
        {
        }
        uint16_t index;
        uint16_t m;
        uint16_t n;
        std::vector<std::string> public_keys;
        std::string self_publickey;
        std::string address;

    } option_;

};

} // namespace commands
} // namespace explorer
} // namespace libbitcoin

