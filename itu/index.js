'use strict';
var yeoman = require('yeoman-generator');
var utils = require('../lib/utils');

module.exports = yeoman.generators.Base.extend({

  initializing: function () {
    this.argument('name', {
      required: true,
      type: String,
      desc: 'The subgenerator name'
    });

  },

  prompting: function () {

    var done = this.async();

    this.log(utils.yoCurio('Itu')); 

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

    var cli = this.config.get('cli');

    this.conflicter.force = true;

    utils.addToDpk( this,
                    this.destinationPath(cli.path + '/' + cli.dpkname), 
                    'itu' + this.name, 
                    'itu\\itu' + this.name + '.pas');

  }
});
