###
	Copyright 2012-2013 David Pearson.
	All rights reserved.
###

child_process=require("child_process")
fs=require "fs"

err=(data) ->
	process.stderr.write data.toString()
out=(data) ->
	process.stdout.write data.toString()

genCpyFunc=(filename, dest) ->
	eval "var func=function (curr, prev) { if (curr.mtime.getTime()!=prev.mtime.getTime()) {console.log(\"cp #{filename} #{dest}\");child_process.exec(\"cp #{filename} #{dest}\");} }"
	func

task "build", "Compile all Coffee Script and move files", (options) ->
	fs.mkdir "lib", (e) ->
		main=child_process.spawn "coffee", ["-o", "lib", "-c", "src"]

		main.stderr.on "data", err
		main.stdout.on "data", out

task "watch", "Watch all source file for changes and build newly changed files", (options) ->
	main=child_process.spawn "coffee", ["-w", "-o", "lib", "-c", "src"]

	main.stderr.on "data", err
	main.stdout.on "data", out

task "loc", "Counts the number of lines of code", (options) ->
	countLines=(dir) ->
		count=0
		srcFiles=fs.readdirSync dir
		for f in srcFiles
			if f.search(".coffee")>0
				lines=fs.readFileSync(dir+"/"+f).toString().split "\n"
				for l in lines
					lineNoWhite=l.replace("/ /g", "").replace("/\t/g", "")
					if lineNoWhite!="" and lineNoWhite.substring(0, 1)!="#"
						count++

		count

	console.log countLines("src")+countLines("src/speakers")