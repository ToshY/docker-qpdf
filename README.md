<h1 align="center"> 📃️ docker-qpdf </h1>

<div align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/toshy/docker-qpdf/security.yml?branch=main&label=Security%20check" alt="Security check" />
    <br /><br />
    <div>A <a href="https://ghcr.io/toshy/docker-qpdf">docker image</a> for <a href="https://github.com/qpdf/qpdf">QPDF</a></div>
</div>

## 📝 Quickstart

```shell
docker run -it --rm \
  -v $(pwd)/files:/pdf 
  ghcr.io/toshy/docker-qpdf:latest --help
```

> [!NOTE]
> Make sure to mount to the `/pdf` directory on the container.

## 📚 Examples

Merge PDFs using wildcard character `*`.

```shell
docker run -it --rm -v $(pwd)/files:/pdf --entrypoint /bin/sh ghcr.io/toshy/docker-qpdf:latest -c 'qpdf --empty --pages *.pdf -- result.pdf'
```

> Note: Entrypoint is changed to `/bin/sh` and supplying command with `-c`, as wildcard character `*` is interpreted by shell.

## 🧰 Build

Build docker image from [`docker-bake.hcl`](./docker-bake.hcl) with the `APPLICATION_VERSION` argument the desired QPDF version.

```shell
docker buildx bake --set *.args.APPLICATION_VERSION=12.2.0
```

The built image will be available with the default tag `docker-qpdf:local`.

## ❕ License

This repository comes with a [MIT license](./LICENSE).
