/*
 * Copyright (C) 2019 Zilliqa
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <exception>
#include <iostream>

#include "exn_thrower.h"

extern "C" {

void throw_and_catch_exn(void)
{
  try
  {
    throw std::runtime_error("This is not caught on macOS, why?");
  }
  catch(const std::exception& e)
  {
    std::cout << "Exception successfully caught\n";
  }
}

} // extern "C"
