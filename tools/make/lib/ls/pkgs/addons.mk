#/
# @license Apache-2.0
#
# Copyright (c) 2017 The Stdlib Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#/

# VARIABLES #

# Define the path of the executable:
LIST_PKGS_ADDONS ?= $(TOOLS_PKGS_DIR)/pkgs/addons/bin/cli

# Define the command flags:
LIST_PKGS_ADDONS_FLAGS ?= --ignore=**/_tools/scaffold/**

# Define the directory from which to search for packages:
LIST_PKGS_ADDONS_DIR ?= $(SRC_DIR)


# RULES #

#/
# Prints a list of all packages containing Node.js native add-ons.
#
# @param {string} [LIST_PKGS_ADDONS_DIR] - absolute path of the directory from which to search (default: source directory)
#
# @example
# make list-pkgs-addons
#
# @example
# make list-pkgs-addons LIST_PKGS_ADDONS_DIR=$PWD/lib/node_modules/\@stdlib/blas
#/
list-pkgs-addons: $(LIST_PKGS_ADDONS) $(NODE_MODULES)
	$(QUIET) NODE_PATH="$(NODE_PATH)" $(NODE) "$(LIST_PKGS_ADDONS)" $(LIST_PKGS_ADDONS_FLAGS) "$(LIST_PKGS_ADDONS_DIR)"

.PHONY: list-pkgs-addons
