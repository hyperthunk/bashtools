#!/usr/bin/env ruby

require 'fileutils'
require 'open4'

def compose(mod=self, *methods)
    lambda do |*args|
        methods.each do |m|
            *args = mod.method(m.to_sym).call(*args)
        end
        args
    end
end

class CommandStatus
    @@attrs = [
        :exitstatus,
        :pid,
        :command,
        :stdout,
        :stderr
    ].freeze.each { |name| attr_reader name }
    
    def success?
        exitstatus.eql? 0    
    end
    
    def initialize command, process_status, stdout, stderr
        @command = command
        @@attrs[0..1].each do |status_flag|
            instance_variable_set("@#{ status_flag }",
                process_status.send(status_flag))
        end
        @stdout, @stderr = stdout, stderr
    end
    
end

def run prc
    begin
        prc.call
    ensure
        yield
    end
end

def echo s
    puts s
    s
end

def base_shell *args
    #cmdtxt = args.join(" ")
    #redirect_to = "#{ $tempdir }/#{ Time.now.to_f }.#{ cmdtxt.hash.to_s[1..-1] }.stdout"
    #cmd = "#{ cmdtxt } 2>&1 | tee #{ redirect_to }"

    cmd = args.join(" ")

    psout, pserr = [], []

    pstatus =
    Open4.popen4(cmd) do |pid,stdin,stdout,stderr|
        yield stdout, stderr, stdin, pid if block_given?
        tsout = Thread.new {
            unless stdout.eof?
                psout.push echo(stdout.gets) until stdout.eof?
            end
        }
        tserr = Thread.new {
            unless stderr.eof?
                pserr.push echo(stderr.gets) until stderr.eof?
            end
        }
        tsout.join
        tserr.join
    end

    status = CommandStatus.new cmd, pstatus,
        psout.freeze, pserr.freeze
    return status
end

def shell *args
    status = base_shell(*args)
    unless status.exitstatus.eql?(0)
       abort(cmd, "[Rake Build Error] Non-zero exit status")
    end
    return status
end
