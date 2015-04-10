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

    var dpkfile = this.config.get('dpkfile');
    var hook = 'contains';
    var insert = '  ' + ('itu' + this.name) + ' in \'' + 'itu\\itu' + this.name + '.pas' + '\' {' + ('it' + this.name) + '}';
    
    this.log(this.destinationPath(dpkfile));

    this.conflicter.force = true;

    var file = this.fs.read(this.destinationPath(dpkfile));

    if (file.indexOf(('itu' + this.name)) === -1) {
      this.fs.write(this.destinationPath(dpkfile), file.replace(hook, hook +'\n' + insert + ','));
    }

  }
});
