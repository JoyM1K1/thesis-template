# 学位論文用テンプレート

筑波大学の学位論文用のテンプレートです。  
[SFC の修士論文に（たぶん）準拠した LaTeX テンプレート](https://github.com/ymrl/thesis-template)を参考にさせていただきました。変更点は以下の通りです。

- ディレクトリでソースファイル・出力ファイル・画像ファイルを区別した。

- .latexmkrc を追加。それに伴って Makefile も修正。

- Dockerfile を同梱。

## 使い方

### 手元に LaTeX をコンパイルできる環境がある場合

こちらは簡単でプロジェクトディレクトリ(この README.md があるディレクトリ)で `make` するだけで OK です。

```zsh
$ cd {project directory}
$ make
```

### 手元に LaTeX をコンパイルできる環境がない場合

LaTeX 環境を local に用意してもらってもいいですが、おすすめは Docker を使って環境構築してしまう方法です。  
Docker 環境がある場合は

```zsh
$ cd {project directory}
$ docker build -t hoge/fuga .
```

で Docker イメージを作り、

```zsh
$ docker run --rm -v `pwd`:/workdir hoge/fuga make
```

でコンパイルできます。

## VSCode で保存時にコンパイルしたい時

拡張機能の[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)をインストールしていることを前提とします。

### Docker を使わない場合

*settings.json*の中に

```json
"latex-workshop.latex.recipes": [
    {
      "name": "compile",
      "tools": ["make"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "make",
      "command": "make",
      "args": [
        "-C",
        ".."
      ]
    }
  ],
  "latex-workshop.latex.autoBuild.run": "onFileChange",
  "latex-workshop.latex.outDir": "%DIR%/../out"
```

を追加すれば OK です。

### Docker を使う場合

*settings.json*の中に

```json
"latex-workshop.latex.recipes": [
    {
      "name": "compile",
      "tools": ["make"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "make",
      "command": "docker",
      "args": [
        "run",
        "--rm",
        "-v",
        "%DIR%/..:%DIR%/..",
        "-w",
        "%DIR%/..",
        "hoge/fuga",
        "make"
      ]
    }
  ],
  "latex-workshop.latex.autoBuild.run": "onFileChange",
```

を追加すれば OK です。

## GitHub で論文を管理するには

このレポジトリのトップページの[Use this template](https://github.com/JoyM1K1/thesis-template-tsukuba/generate) (← このリンクからでも飛べます) からテンプレートがそのまま使えます。あとは作ったレポジトリを clone してお好きに編集してください。

## ライセンス

私(@JoyM1K1)が改造した部分についてはすべての権利を放棄いたします。
