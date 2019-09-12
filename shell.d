void main(){
    import std.file;
    import std.algorithm.comparison:  equal;
    import std.stdio: write, writeln, writef, writefln , fscanf, readln;
    import std.exception : assertThrown;
    import std.array; 
    import std.string;
    import std.path;
    import std.uni;
    import std.format;

    string parametros;

    while(1){
        write(">");
        parametros = readln();
        // write(parametros);
        auto aux = parametros.split;

        auto dir = deleteme ~ "dir"; 
        write(dir);
        auto f = deleteme ~ "f";
        auto target = deleteme ~ "target";

        if(cmp(aux[0],"mkdir") == 0){
            aux[1].mkdir;
        }
        else if(cmp(aux[0],"rmdir") == 0){
            aux[1].rmdir;
        }
        else if(cmp(aux[0],"mkfile") == 0){
            append(aux[1],aux[2]); //Nome do arquivo,dados do arquivo
        } 
        else if(cmp(aux[0],"rmfile") == 0){
            remove(aux[1]);
        }
        else if(cmp(aux[0],"copy") == 0){
            copy(aux[1],aux[2]);
        }
        else if(cmp(aux[0],"cat") == 0){
           write(readText(aux[1]),"\n"); 
        }
        else if(cmp(aux[0],"clear") == 0){
            write("\033[H\033[2J");
        }
        // else if(cmp(aux[0],"move"){
            
        // }
        else if(cmp(aux[0],"exit") == 0){
            return;
        }
        else{
            write("Comando não encontrado\n");
        }
    }
}  




    
    

    // assert(!dir.isFile); 
    // assert(!f.exists);

    // // assertThrown!FileException(f.isFile);
    
   
    
    // assert(f.isFile);
    
    // writeln ( asAbsolutePath ( cast(string) null ).array); // ""
    // version(Posix){ 
    //    writeln ( asAbsolutePath ( "/ foo" ) .array); // "/ foo"
    // }
