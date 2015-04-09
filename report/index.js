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
    this.template(
      this.templatePath('ituReport.pas'),
      this.destinationPath(this.context.path +'/' + 'itu' + this.name + '.pas'),
      this.context
    );
    
    this.template(
      this.templatePath('ituReport.dfm'),
      this.destinationPath(this.context.path +'/' + 'itu' + this.name + '.dfm'),
      this.context
    );

  }
});
