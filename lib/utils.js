var chalk = require('chalk');
//var fs = require('fs');

function addToFile(yo, filepath, id, line, hook, after, delimiter) {
	try {
		var file = yo.fs.read(filepath,'utf8');
		if (file != undefined && file.indexOf(id) === -1) {
			if (after) {
				yo.fs.write(filepath,
			 			 	file.replace(hook, hook +'\n' + line + delimiter));
			} else {
				yo.fs.write(filepath,
			 			 	file.replace(hook, line +'\n  ' + hook + delimiter));
			}
		}
	} catch(e) {
		var shortpath = filepath.replace( process.cwd() + '/', '');
		yo.log('    ' + 'file ' + chalk.green('"' + shortpath + '"') + ' not found... ' + chalk.red ('ignoring'));
	}
};

exports.addToDpk = function (yo, dpkpath, unit, path) {
	var dpkline 	= '  ' + unit + ' in ' + '\'' + path + '\'';
	addToFile(yo, dpkpath + '.dpk', unit, dpkline, 'contains', true, ',');
	var dprojline 	= '  <DCCReference Include="' + path +'"/>';
	addToFile(yo, dpkpath + '.dproj', unit, dprojline, '</ItemGroup>', false, '');
};

exports.addToDpr = function (yo, dprpath, unit, path) {
	var dprline 	= '  ' + unit + ' in ' + '\'' + path + '\'';
	addToFile(yo, dprpath + '.dpr', unit, dprline, 'uses', true, ',');
	var dprojline 	= '  <DCCReference Include="' + path +'"/>';
	addToFile(yo, dprpath + '.dproj', unit, dprojline, '</ItemGroup>', false, '');
};

exports.yoCurio = function (msg) {
	var curio = chalk.blue('     ______              _   _   ') + '\n' +
      chalk.blue('    / ____/__  __ _____ (_)_//_') + chalk.green(' v0.2.18') + '\n' + 
      chalk.blue('   / /    / / / // ___// // __ \\ ') + '\n' +
      chalk.blue('  / /___ / /_/ // /   / // /_/ / ') + '\n' +
      chalk.blue('  \\____/ \\__,_//_/   /_/ \\____/ ');
      if (msg!==undefined) {
      	 curio = curio + chalk.red(msg);
      }
      return curio + '\n';
};
