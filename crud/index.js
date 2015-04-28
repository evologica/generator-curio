'use strict';
var yeoman = require('yeoman-generator');
var utils = require('../lib/utils');

module.exports = yeoman.generators.Base.extend({
  initializing: function () {
    this.argument('name', {
      required: true,
      type: String,
      desc: 'The crud name'
    });
  },

  prompting: function () {

    var done = this.async();

    this.log(utils.yoCurio('Crud'));
 
    var prompts = [

      {
        name: 'classname',
        message: 'Qual o nome da classe (sem ng) do CRUD?',
        validate: function (classname) {
          if (classname !== undefined && classname !== null && classname !== '') {
            return true;
          } else {
            return 'Informar o nome da classe é obrigatório';
          }
        }        
      },

      {
        name: 'guicode',
        message: 'Qual o código da GUI?',
        default: '0'
      },

      {
        name: 'itupath',
        message: 'Onde deseja gerar a itu?',
        default: 'cli/win/itu'
      },            

      {
        name: 'uccode',
        message: 'Qual o código do Caso de Uso?',
        default: '0'
      },

      {
        name: 'ucupath',
        message: 'Onde deseja gerar a ucu?',
        default: 'srv/src/ucu'
      }, 

    ];

    this.prompt(prompts, function (props) {
      this.context = props;
      this.context.crudname = this.name;
      done();
    }.bind(this));
  },

  writing: function () {

    var cli = this.config.get('cli');
    var srv = this.config.get('srv');

    this.template(
      this.templatePath('ucuCrud.pas'),
      this.destinationPath(this.context.ucupath + '/ucu' + this.name + '.pas'),
      this.context
    );

    this.template(
      this.templatePath('ituCrud.pas'),
      this.destinationPath(this.context.itupath + '/itu' + this.name + '.pas'),
      this.context
    );

    this.template(
      this.templatePath('ituCrud.dfm'),
      this.destinationPath(this.context.itupath + '/itu' + this.name + '.dfm'),
      this.context
    );

    this.template(
      this.templatePath('crud.mfg'),
      this.destinationPath('srv/mdl/' + this.name + '.mfg'),
      this.context
    );    

    this.conflicter.force = true;

    utils.addToDpk( this,
                    this.destinationPath(cli.path + '/' + cli.dpkname), 
                    'itu' + this.name, 
                    'itu\\itu' + this.name + '.pas');
    
    utils.addToDpr( this,
                    this.destinationPath(srv.path + '/' + srv.dprname), 
                    'ucu' + this.name, 
                    'ucu\\ucu' + this.name + '.pas');

  }
});
