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

    this.log(utils.yoCurio('Report'));    

    var prompts = [
      
      {
        name: 'guicode',
        message: 'Qual o código da GUI?',
        default: '0'
      }, 

      {
        name: 'unitpath',
        message: 'Onde deseja gerar unit?',
        default: 'cli/win/itu'
      },            

      {
        name: 'spspath',
        message: 'Onde deseja gerar o .sps?',
        default: 'srv/rel/sps'
      }, 

    ];

    this.prompt(prompts, function (props) {
      this.context = props;
      this.context.ituname = this.name;
      done();
    }.bind(this));
  },

  writing: function () {
    this.template(
      this.templatePath('ituReport.pas'),
      this.destinationPath(this.context.unitpath +'/' + 'itu' + this.name + '.pas'),
      this.context
    );
    
    this.template(
      this.templatePath('ituReport.dfm'),
      this.destinationPath(this.context.unitpath +'/' + 'itu' + this.name + '.dfm'),
      this.context
    );

    this.template(
      this.templatePath('template.sps'),
      this.destinationPath(this.context.spspath +'/' + this.name + '.sps'),
      this.context
    );    

    var cli = this.config.get('cli');

    utils.addToDpk( this,
                    this.destinationPath(cli.path + '/' + cli.dpkname), 
                    'itu' + this.name, 
                    'itu\\itu' + this.name + '.pas');


  }
});
