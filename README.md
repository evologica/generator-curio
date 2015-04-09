> [Yeoman](http://yeoman.io) Curió Generator

```{r, engine='bash', count_lines}
npm install -g yo
npm install -g generator-curio

```

```{r, engine='bash', count_lines}
mkdir app
cd app
yo curio

```

├── srv .......................................... backend dev files
│   ├── mdl ...................................... domain model files
│   │   └── model.uml
│   ├── sql ...................................... sql scripts
│   │   ├── deploy ............................... deploy scripts
│   │   └── alter ................................ db evolution scritps
│   └── src ...................................... backend source code
│       ├── ngu .................................. business class units
│       │   └── nguVersaoBanco.pas   
│       ├── ucu .................................. use case units
│       │   └── ucuAppMain.pas
│       ├── lib
│       │   └── acuRegisterModelMappings.pas ..... model-to-code mapping
│       ├── app.dpr .............................. delphi main project
│       ├── svuApp.pas
│       ├── svuApp.dfm
│       ├── mainmenu.xml ......................... win32 GUI menu design
│       └── VersionInfo.rc .......................
└── cli .......................................... front-end dev files
    └── win ...................................... front-end win32
        ├── itu .................................. interface form units
        │   └── ituAppMain.pas
        └── App.dpk .............................. delphi win32 main project 

## Generating form interfaces (it's)
```bash
yo curio:itu CadastrarPessoa

```
    └── cli
        └── win
            └── itu
                ├── ituCadastrarPessoa.pas 
                └── ituCadastrarPessoa.dfm
```

## Generating reports (rit's)
```bash
yo curio:report RelatorioPessoa

```
    └── cli
        └── win
            └── itu
                ├── ituRelatorioPessoa.pas 
                └── ituRelatorioPessoa.dfm
```

## Generating search units (suc's) #TODO
```bash
yo curio:report sucuPessoa

```
    └── srv
        └── src
            └── sucu
                ├── sucuPessoa.pas
                └── sucuPessoa.dfm
```


