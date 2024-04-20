#!/usr/bin/env python3
import os
import sys
import json
import hashlib
from datetime import datetime


benchmarks_dir = sys.argv[1]
json_file = sys.argv[2]
test_name = sys.argv[3]
arkscript_commit_id = sys.argv[4] or ""
now = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')


def sha256sum(filename):
    with open(filename, 'rb', buffering=0) as f:
        return hashlib.file_digest(f, 'sha256').hexdigest()


def read_data(path):
    if os.path.exists(path):
        with open(path) as f:
            return json.load(f)
    else:
        return {}


def compute(path, run):
    data = read_data(path)
    file_hash = sha256sum(run["command"].split(" ")[-1])
    test_key = f"{test_name}-{file_hash}"

    if data.get(test_key) is None:
        data[test_key] = []
    data[test_key].append({
        "date": now,
        "mean": run["mean"],
        "median": run["median"],
        "min": run["min"],
        "max": run["max"]
    })

    if "arkscript" in run["command"]:
        data[test_key][-1]["commit"] = arkscript_commit_id

    if not os.path.exists(os.path.dirname(path)):
        os.mkdir(os.path.dirname(path))
    with open(path, "w") as f:
        json.dump(data, f)


results = read_data(json_file)
for run in results["results"]:
    command = run["command"]
    if command.startswith("build/arkscript "):
        compute(f"{benchmarks_dir}/data/arkscript.json", run)
    elif command.startswith("lua "):
        compute(f"{benchmarks_dir}/data/lua.json", run)
    elif command.startswith("node "):
        compute(f"{benchmarks_dir}/data/node.json", run)
    elif command.startswith("python "):
        compute(f"{benchmarks_dir}/data/python.json", run)
    elif command.startswith("ruby "):
        compute(f"{benchmarks_dir}/data/ruby.json", run)
    elif command.startswith("./wren_cli "):
        compute(f"{benchmarks_dir}/data/wren.json", run)
    else:
        print(f"Unrecognized command: {command} -- It seems this script needs to be updated!")
        sys.exit(1)
