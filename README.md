# Benchmarks

The content of this repository is automatically updated each time a new commit land to the `dev` branch of [ArkScript](https://github.com/ArkScript-lang/Ark) (see [this workflow](https://github.com/ArkScript-lang/Ark/blob/dev/.github/workflows/benchmarks.yml) to learn how it works).

Some benchmarks come from [wren benchmarks](https://github.com/wren-lang/wren/blob/main/test/benchmark).

## Languages used versions

- ArkScript: latest
- Lua: 5.4.1
- NodeJS: 18
- Python: 3.11
- Ruby: 3.3
- Wren: 0.4.0

## Basic workflow

1. When a commit land to `dev` on ArkScript, the `benchmarks` workflow starts
2. It downloads all the languages versions required and compile ArkScript in release
3. The `run.sh` script starts, making use of `hyperfine` and json reports
4. The generated json report is then passed to `insert_data.py`, in charge of creating new entries under `data/<language>.json`

### Data/language.json format

Entries are crafted from the test name (eg `ackermann`) and the sha256 hash of the source file (in this example, the hash for ackermann/arkscript.ark) ; this way if the source file changes, so does the test since it no longer represents the same thing.

Each test entry is a collection of runs, the newest being the last element of the array, the oldest being the first one. All the times are reported in seconds.

For `data/arkscript.json`, the commit tested (of ArkScript, not of this repo) is also added.

```json
{
  "ackermann-1d28886e6e36b86f0ba66e4dfb8ee29ca6e2e158628f02f77795308c0244e171": [
    {
      "date": "2024-03-19 23:05:49",
      "mean": 0.13940904812000005,
      "median": 0.14287859602000003,
      "min": 0.13007726502,
      "max": 0.14536326402000002,
      "commit": "<hash>"
    },
    // ...
  ]
}
```