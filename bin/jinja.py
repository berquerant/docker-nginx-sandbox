from dataclasses import dataclass, asdict
from typing import TextIO

from jinja2 import Template


@dataclass
class Argument:
    instance_num: int
    nginx_port: int
    api_port: int
    debug: bool


def render(r: TextIO, arg: Argument) -> str:
    data = r.read()
    template = Template(source=data)
    return template.render(**asdict(arg))


if __name__ == "__main__":
    import sys
    from argparse import ArgumentParser

    p = ArgumentParser(
        description="Render jinja template from stdin",
    )
    p.add_argument(
        "-n", action="store", type=int, default=1, help="number of instances"
    )
    p.add_argument(
        "--nginx_port", action="store", type=int, default=18000, help="nginx base port"
    )
    p.add_argument(
        "--api_port", action="store", type=int, default=19000, help="api base port"
    )
    p.add_argument(
        "--debug",
        action="store_true",
        help="enable debug log",
    )
    args = p.parse_args()
    result = render(
        sys.stdin,
        Argument(
            instance_num=args.n,
            nginx_port=args.nginx_port,
            api_port=args.api_port,
            debug=args.debug,
        ),
    )
    print(result, end="")
