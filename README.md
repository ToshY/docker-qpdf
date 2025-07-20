<h1 align="center"> 📃️ docker-qpdf </h1>

<div align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/toshy/docker-qpdf/security.yml?branch=main&label=Security%20check" alt="Security check" />
    <br /><br />
    <div>A <a href="https://ghcr.io/toshy/docker-qpdf">docker image</a> for <a href="https://github.com/qpdf/qpdf">QPDF</a></div>
</div>

## Info

[QPDF](https://github.com/qpdf/qpdf) is a command-line tool and C++ library that performs content-preserving
transformations on PDF files

## 🧰 Requirements

* [Docker](https://docs.doctker.com/get-docker/)

## 🐋 Usage

```shell
docker run -it --rm -v $(pwd)/files:/pdf ghcr.io/toshy/docker-qpdf:latest --help
```

```text
Run "qpdf --help=topic" for help on a topic.
Run "qpdf --help=--option" for help on an option.
Run "qpdf --help=all" to see all available help.

Topics:
  add-attachment: attach (embed) files
  advanced-control: tweak qpdf's behavior
  attachments: work with embedded files
  completion: shell completion
  copy-attachments: copy attachments from another file
  encryption: create encrypted files
  exit-status: meanings of qpdf's exit codes
  general: general options
  help: information about qpdf
  inspection: inspect PDF files
  json: JSON output for PDF information
  modification: change parts of the PDF
  overlay-underlay: overlay/underlay pages from other files
  page-ranges: page range syntax
  page-selection: select pages from one or more files
  pdf-dates: PDF date format
  testing: options for testing or debugging
  transformation: make structural PDF changes
  usage: basic invocation

For detailed help, visit the qpdf manual: https://qpdf.readthedocs.io
```

> Note: make sure to mount to the `/pdf` directory on the container.

## Examples

Merge PDFs using wildcard character `*`.

```shell
docker run -it --rm -v $(pwd)/files:/pdf --entrypoint /bin/sh ghcr.io/toshy/docker-qpdf:latest -c 'qpdf --empty --pages *.pdf -- result.pdf'
```

> Note: Entrypoint is changed to `/bin/sh` and supplying command with `-c`, as wildcard character `*` is interpreted by shell.

## 🛠️ Build

Build docker image from [`docker-bake.hcl`](./docker-bake.hcl) with the `APPLICATION_VERSION` argument the desired QPDF version.

```shell
docker buildx bake --set *.args.APPLICATION_VERSION=12.2.0
```

The built image will be available with the default tag `docker-qpdf:local`.

## ❕ License

This repository comes with a [MIT license](./LICENSE).
