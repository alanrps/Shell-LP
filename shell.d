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
 
    
    // int quantidade_argumentos(string parametros){
    //     int quantidade = 0;
    //     for(int i = 0;i < count(parametros);i++){
    //         if(parametros[i] == ' ')
    //             quantidade += 1;
    //     }
    //     write(quantidade);
    //     return quantidade;
        
    // }
    while(1){
        write(">");
        parametros = readln();
        // write(parametros);
        // int quantidade = quantidade_argumentos(parametros);
        auto aux = parametros.split;
        auto quantidade = count(aux);
        string decisao;
        string diretorios;
    
        auto dir = deleteme ~ "dir"; 
        // write(dir);
        auto f = deleteme ~ "f";
        auto target = deleteme ~ "target";

        if(cmp(aux[0],"mkdir") == 0){
            for(int i = 1;i < quantidade;i++){
                if(aux[i].exists == true){
                    write("Diretorio ja existe,deseja substituir?(s ou n)\n");
                    decisao = readln();
                    if(cmp(decisao,"s") == 0 || cmp(decisao,"S") == 0){
                        aux[i].rmdir;
                        aux[i].mkdir;
                    }else{
                        write("Diretorio foi mantido\n");
                    }
                }else{
                    aux[i].mkdir;
                }
            }  
        }
        else if(cmp(aux[0],"rmdir") == 0){
            for(int i = 1;i < quantidade;i++){
                aux[i].rmdir;
            }  
        }
        else if(cmp(aux[0],"mkfile") == 0){
            for(int i = 1;i < quantidade - 1;i++){
                if(aux[i].exists == true){
                    write("Arquivo ja existe,deseja substituir?(s ou n)\n");
                    decisao = readln();
                    if(cmp(decisao,"s") == 0 || cmp(decisao,"S") == 0){
                        remove(aux[i]);
                        append(aux[i],aux[i+1]); //Nome do arquivo,dados do arquivo
                    }else if(cmp(decisao,"n") == 0 || cmp(decisao,"N") == 0){
                        write("Arquivo foi mantido\n");
                    }
                }else{
                    append(aux[i],aux[i+1]); //Nome do arquivo,dados do arquivo
                }//adicionar comando inválido
            }  
        } 
        else if(cmp(aux[0],"rmfile") == 0){
            for(int i = 1;i < quantidade;i++)
                remove(aux[i]);
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
        else if(cmp(aux[0],"cd") == 0){
            //if(aux[1] != "..")
            //diretorios = aux[1];
            //concatenar (/ + aux[1])
            //printar vetor
                aux[1].chdir;
        }
        // else if(cmp(aux[0],"move"){
            
        // }
        // else if(cmp(aux[0],"ls") == 0){
            
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
