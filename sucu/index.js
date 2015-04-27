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

    this.log('You called the Conexo subgenerator with the argument ' + this.name + '.');
  },

  prompting: function () {

    var done = this.async();

    var prompts = [

      {
        name: 'entcode',
        message: 'Qual o Código da Entidade?',
        default: '0'
      },

      {
        name: 'siupath',
        message: 'Onde deseja gerar a siu?',
        default: 'cli/win/siu'
      },            

      {
        name: 'sucupath',
        message: 'Onde deseja gerar a sucu?',
        default: 'srv/src/sucu'
      }, 

    ];

    this.prompt(prompts, function (props) {
      this.context = props;
      this.context.sucuname = this.name;
      done();
    }.bind(this));
  },

  writing: function () {

    var cli = this.config.get('cli');
    var srv = this.config.get('srv');

    this.template(
      this.templatePath('sucuObject.pas'),
      this.destinationPath(this.context.sucupath + '/sucu' + this.name + '.pas'),
      this.context
    );

    this.template(
      this.templatePath('siuObject.pas'),
      this.destinationPath(this.context.siupath + '/siu' + this.name + '.pas'),
      this.context
    );

    this.template(
      this.templatePath('siuObject.dfm'),
      this.destinationPath(this.context.siupath + '/siu' + this.name + '.dfm'),
      this.context
    );

    this.conflicter.force = true;

    utils.addToDpk( this,
                    this.destinationPath(cli.path + '/' + cli.dpkname), 
                    'siu' + this.name, 
                    'siu\\siu' + this.name + '.pas');     

    utils.addToDpr( this,
                    this.destinationPath(srv.path + '/' + srv.dprname), 
                    'sucu' + this.name, 
                    'sucu\\sucu' + this.name + '.pas');                       

  }
});
