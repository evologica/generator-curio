'use strict';
var yeoman = require('yeoman-generator');

module.exports = yeoman.generators.Base.extend({

  initializing: function () {
    this.argument('name', {
      required: true,
      type: String,
      desc: 'The subgenerator name'
    });

    this.log('You called the Conexo subgenerator with the argument ' + this.name + '.');
  },

  prompting: function () {

    var done = this.async();

    var prompts = [

      {
        name: 'guicode',
        message: 'Qual o código da GUI?',
        default: '0'
      },

      {
        name: 'path',
        message: 'Onde deseja gerar unit?',
        default: 'cli/win/itu'
      },            

    ];

    this.prompt(prompts, function (props) {
      this.context = props;
      this.context.ituname = this.name;
      done();
    }.bind(this));
  },

  writing: function () {

    var ituPath = this.context.path +'/' + 'itu' + this.name + '.pas';

    this.template(
      this.templatePath('ituInterfaceForm.pas'),
      this.destinationPath(ituPath),
      this.context
    );

    this.template(
      this.templatePath('ituInterfaceForm.dfm'),
      this.destinationPath(this.context.path +'/' + 'itu' + this.name + '.dfm'),
      this.context
    );

    this.conflicter.force = true;

    var dpkPath = this.config.get('dpkpath');
    var dpkFile = this.fs.read(this.destinationPath(dpkPath));    
    var dpkHook = 'contains';
    var dpkDependency = '  ' + ('itu' + this.name) + ' in \'' + 'itu\\itu' + this.name + '.pas' + '\' {' + ('it' + this.name) + '}';
    
    this.log(this.destinationPath(dpkPath));

    if (dpkFile.indexOf(('itu' + this.name)) === -1) {
      this.fs.write(this.destinationPath(dpkPath), dpkFile.replace(dpkHook, dpkHook +'\n' + dpkDependency + ','));
    }

    var dprojPath = this.config.get('dprojpath');

    try {
      var dprojFile = this.fs.read(this.destinationPath(dprojPath));
    } catch (err) {
      dprojFile = undefined;
    }
    if (dprojFile !== undefined) {

      var dprojHook = '</ItemGroup>';
      var dprojDependency = ' ' + '<DCCReference Include="itu\\itu' + this.name + '.pas"><Form>it' + this.name + '</Form></DCCReference>';

      if (dprojFile.indexOf(('itu' + this.name)) === -1) {
        this.fs.write(this.destinationPath(dprojPath), dprojFile.replace(dprojHook, dprojDependency + '\n  ' + dprojHook));
      }  

    }

  }
});
