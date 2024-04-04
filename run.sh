#!/usr/bin/env bash

script_path="$(cd -- "$(dirname "$0")" > /dev/null 2>&1; pwd -P)"
test_path=$1
folder="$script_path/benchmarks/$test_path"

hyperfine --version
echo arkscript $(build/arkscript --version)
lua -v
echo node $(node --version)
python --version
ruby --version
./wren_cli --version

file=$(mktemp)
hyperfine --warmup 5 --runs 20 --export-json "$file" \
  "build/arkscript $folder/arkscript.ark" \
  "lua $folder/lua.lua" \
  "node $folder/node.js" \
  "python $folder/python.py" \
  "ruby $folder/ruby.rb" \
  "./wren_cli $folder/wren.wren"
exit_code=$?

if [[ $exit_code == 0 ]]; then
  python "$script_path/insert_data.py" "$script_path" "$file" "$test_path" "$ARKSCRIPT_COMMIT"
  echo "Output files generated"
else
  echo "An error occurred while running hyperfine benchmarks"
  exit 1
fi