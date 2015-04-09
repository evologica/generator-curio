# generator-conexo [![Build Status](https://secure.travis-ci.org/conexo/generator-conexo.png?branch=master)](https://travis-ci.org/conexo/generator-curio)

> [Yeoman](http://yeoman.io) Curió Generator



```bash
npm install -g yo
npm install -g generator-curio

```

```bash
mkdir app
cd app
yo curio

```
    .
    ├── srv
    │   ├── mdl
    │   │   └── model.uml
    │   ├── sql
    │   │   ├── deploy
    │   │   └── alter
    │   └── src
    │       ├── ngu
    │       │   └── nguVersaoBanco.pas    
    │       ├── ucu
    │       │   └── ucuAppMain.pas
    │       ├── lib
    │       │   └── acuRegisterModelMappings.pas
    │       ├── app.dpr
    │       ├── svuApp.pas
    │       ├── svuApp.dfm
    │       ├── mainmenu.xml
    │       └── VersionInfo.rc
    └── cli
        ├── win
        │   ├── itu
        │   │   └── ituAppMain.pas 
        │   └── App.dpk    

## Gerador de interfaces
```bash
yo curio:itu CadastrarPessoa

```

    └── cli
        └── win
            └── itu
                ├── ituCadastrarPessoa.pas 
                └── ituCadastrarPessoa.dfm


## Gerador de interfaces
```bash
yo curio:report RelatorioPessoa

```

    └── cli
        └── win
            └── itu
                ├── ituRelatorioPessoa.pas 
                └── ituRelatorioPessoa.dfm


## License

MIT
