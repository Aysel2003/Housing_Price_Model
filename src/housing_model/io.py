import json
from pathlib import Path


def ensure_parent(path: str) -> None:
    Path(path).parent.mkdir(parents=True, exist_ok=True)


def write_json(path: str, payload: dict) -> str:
    ensure_parent(path)
    Path(path).write_text(
        json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    return path


## just for writing into files, such as metrics
## we can do this also with with open as well but this is more production ready form
