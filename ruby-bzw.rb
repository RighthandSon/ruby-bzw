module Bzw

    def self.initialize(filename, append = "w")
        @@filename = filename
        @@append = append
        @@content = ""
    end

    def self.create(type, group = false, **args)
        if group
            @@content += "group "
        end
        @@content += type
        self.emptyline(1)
        for params in args do
            @paramArgs = params
            if params.instance_of?(Array)
                @paramArgs = params.join(" ")
            end
            self.indent(2)
            
            @@content += "#{args[params]} #{@paramArgs}"
            self.emptyline
        end
        @@content += "end"
        self.emptyline(2)
    end

    def self.define(name, enddef)
        if not enddef
            @@content += "define #{name}"
        else
            @@content += "enddef"
            
        self.emptyline(2)
        end
    end

    def self.include(path)
        @@content += "include #{path}"
        self.emptyline(2)
    end

    def self.indent(number = 1)
        @@content += " " * number
    end

    def self.insert(inputfile)
        File.foreach(inputfile) {|line| @@content += line}
    end

    def self.comment(words)
        @@content += "# #{words}"
        self.emptyline(2)
    end

    def self.emptyline(amount = 1)
        @@content += "\n" * amount
    end
        
    def self.writeOut()
        if File.extname(@@filename) != ".bzw"
            @@filename += ".bzw"            
        end
        f = File.new(@@filename, @@append)
        f.write(@@content)
    end

    def self.stdOut()
        print @@content
    end
    
end