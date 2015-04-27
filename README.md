# Curió Generator
```
     ______              _   _   
    / ____/__  __ _____ (_)_//_ 
   / /    / / / // ___// // __ \
  / /___ / /_/ // /   / // /_/ /
  \____/ \__,_//_/   /_/ \____/                                
```
A Yeoman generator to scaffold a Curió framework application.

## Instalation

```shell
npm install -g yo
npm install -g generator-curio
```

## Generating a new Curió Application
```shell
mkdir app
cd app
yo curio
```

It generates the below structure:

```
├── srv .......................................... backend dev files
│   ├── mdl ...................................... domain model files
│   │   └── model.uml
│   ├── rel ...................................... report files
│   │   └── sps .................................. StyleVision project files
│   │   └── xslt ................................. generated xslt files
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
    └── win ...................................... front-end win32 source code
        ├── itu .................................. interface form units
        │   └── ituAppMain.pas
        └── App.dpk .............................. delphi win32 main project 

```

## Generating form interfaces (it's)
```shell
yo curio:itu CadastrarPessoa
```

```
    └── cli
        └── win
            └── itu
                ├── ituCadastrarPessoa.pas 
                └── ituCadastrarPessoa.dfm
```
It also includes the new form as a dependency in your dpk file (and dproj, if exists):

```pascal
contains
    ituCadastrarPessoa in 'itu\ituCadastrarPessoa.pas' {itCadastrarPessoa},
    ...
```

## Generating reports (rit's)
```shell
yo curio:report RelatorioPessoa

```

```
    └── cli
    │   └── win
    │       └── itu
    │           ├── ituRelatorioPessoa.pas
    │           └── ituRelatorioPessoa.dfm
    └── srv 
        └── rel
            └── sps
                └── RelatorioPessoa.sps                
```

## Generating search units (suc's) #TODO
```shell
yo curio:sucu sucuPessoa

```

```
    ├── cli
    │   └── win
    │       └── siu
    │           ├── siuPessoa.pas
    │           └── siuPessoa.dfm
    │  
    └── srv
        └── src
            └── sucu
                └── sucuPessoa.pas
```


