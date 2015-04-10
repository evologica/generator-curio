'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');

module.exports = yeoman.generators.Base.extend({
  initializing: function () {
    this.pkg = require('../package.json');
  },

  prompting: function () {

    var done = this.async();

    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the ' + chalk.blue('Curio Framework') + ' generator!'
    ));

    var prompts = [
      {
        name: 'appname',
        message: 'Qual o nome da aplicação?',
      },
      {
        name: 'port',
        message: 'Qual a porta padrão do serviço?',
        default: 0
      },            

    ];

    this.prompt(prompts, function (props) {
      this.context = props;
      // To access props later use this.props.someOption;

      done();
    }.bind(this));
  },

  writing: {
    app: function () {

      // SERVER

      var dprpath = 'srv/src/' + this.context.appname + '.dpr';

      this.config.set('dprpath', dprpath);

      this.template(
        this.templatePath('srv/src/app.dpr'),
        this.destinationPath(dprpath),
        this.context
      );

      this.template(
        this.templatePath('srv/src/svuApp.pas'),
        this.destinationPath('srv/src/svu' + this.context.appname + '.pas'),
        this.context
      );

      this.template(
        this.templatePath('srv/src/svuApp.dfm'),
        this.destinationPath('srv/src/svu' + this.context.appname + '.dfm'),
        this.context
      );

      this.template(
        this.templatePath('srv/src/VersionInfo.rc'),
        this.destinationPath('srv/src/VersionInfo.rc'),
        this.context
      );

      this.template(
        this.templatePath('srv/src/mainmenu.xml'),
        this.destinationPath('srv/src/mainmenu.xml'),
        this.context
      );

      this.copy(
        this.templatePath('srv/src/mmenu.rc'),
        this.destinationPath('srv/src/mmenu.rc')
      );

      this.template(
        this.templatePath('srv/src/ucu/ucuAppMain.pas'),
        this.destinationPath('srv/src/ucu/ucu' + this.context.appname + 'Main.pas'),
        this.context
      );


      this.directory(
        this.templatePath('/srv/src/ngu'),
        this.destinationPath('/srv/src/ngu')
      ); 

      this.directory(
        this.templatePath('/srv/src/lib'),
        this.destinationPath('/srv/src/lib')
      );

      this.directory(
        this.templatePath('/srv/src/lib'),
        this.destinationPath('/srv/src/lib')
      );

      this.directory(
        this.templatePath('/srv/mdl'),
        this.destinationPath('/srv/mdl')
      );

      this.directory(
        this.templatePath('/srv/sql'),
        this.destinationPath('/srv/sql')
      );

      // CLI

      var dpkpath = 'cli/win/' + this.context.appname + '.dpk';
      var dprojpath = 'cli/win/' + this.context.appname + '.dproj';

      this.config.set('dpkpath', dpkpath);
      this.config.set('dprojpath', dprojpath);

      this.template(
        this.templatePath('cli/win/cli.dpk'),
        this.destinationPath(dpkpath),
        this.context
      );

      this.template(
        this.templatePath('cli/win/itu/ituAppMain.pas'),
        this.destinationPath('cli/win/itu/itu' + this.context.appname + 'Main.pas'),
        this.context
      );

      this.config.save();

    },

    /*projectfiles: function () {
      this.fs.copyTpl(
        this.templatePath('editorconfig'),
        this.destinationPath('.editorconfig')
      );
      this.fs.copyTpl(
        this.templatePath('jshintrc'),
        this.destinationPath('.jshintrc')
      );
    }*/
  },

  install: function () {
    //this.installDependencies();
  }
});
