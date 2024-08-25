from argparse import ArgumentParser

from omegaconf import OmegaConf
from hydra import compose

parser = ArgumentParser()
parser.add_argument("--config", type=str, default="./config.yaml")


def main(cfg: OmegaConf):
    pass


if __name__ == "__main__":
    args = parser.parse_args()
    cfg = compose(config_name=args.config)
    OmegaConf.resolve(cfg)
    main(cfg)
