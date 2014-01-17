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

runCmd=(cmd, args) ->
	proc=child_process.spawn cmd, args

	proc.stderr.on "data", err
	proc.stdout.on "data", out

genCpyFunc=(filename, dest) ->
	(curr, prev) ->
		if curr.mtime.getTime()!=prev.mtime.getTime()
			console.log("cp #{filename} #{dest}")
			child_process.exec("cp #{filename} #{dest}")

task "build", "Compile all Coffee Script and move files", (options) ->
	fs.mkdir "lib", (e) ->
		runCmd "coffee", ["-o", "lib", "-c", "src"]

	fs.mkdir "tests", (e) ->
		runCmd "coffee", ["-o", "tests", "-c", "src/tests"]

task "watch", "Watch all source files for changes and build newly changed files", (options) ->
	fs.mkdir "lib", (e) ->
		runCmd "coffee", ["-w", "-o", "lib", "-c", "src"]

	fs.mkdir "tests", (e) ->
		runCmd "coffee", ["-w", "-o", "tests", "-c", "src/tests"]

task "test", "Run the test cases", (options) ->
	invoke "build"

	runCmd "vows", ["--spec", "tests/*"]

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

	console.log countLines("src")+countLines("src/tests")