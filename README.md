# Publish Anaconda Package

A Github Action to publish your software package to an Anaconda repository.

### Example workflow to publish to conda every time you make a new release

```yaml
name: publish_conda

on:
  release:
    types: [published]
    
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: publish-to-conda
      uses: maxibor/conda-package-publish-action@v1.1
      with:
        subDir: '.conda'
        AnacondaToken: ${{ secrets.ANACONDA_TOKEN }}
        platforms: 'all'
        override: true
```
- `subDir` defines the directory where the conda configs live.
- `AnacondaToken` definese the conda API token for password less access.
- `platforms` defines the desired target platform(s). Chain them together as desired. `all` will build... well, all.   
**Possible choices**:
  - all
  - osx-64
  - osx-arm64
  - linux-32
  - linux-ppc64
  - linux-ppc64le
  - linux-s390x
  - linux-armv6l
  - linux-armv7l
  - linux-aarch64
  - win-32 
  - win-64
- `override` is set to false by default. Set to `true` to override existing packages in your conda repository.

### Example project structure

```
.
├── LICENSE
├── README.md
├── myproject
│   ├── __init__.py
│   └── myproject.py
├── conda
│   ├── build.sh
│   └── meta.yaml
├── .github
│   └── workflows
│       └── publish_conda.yml
├── .gitignore
```

### ANACONDA_TOKEN

1. Get an Anaconda token (with read and write API access) at `anaconda.org/USERNAME/settings/access` 
2. Add it to the Secrets of the Github repository as `ANACONDA_TOKEN`

### Build Channels
By Default, this Github Action will search for conda build dependancies (on top of the standard channels) in `conda-forge` and `bioconda`
