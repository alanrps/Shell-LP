import std.algorithm.comparison:  equal;
import std.stdio: write, writeln, writef, writefln , fscanf, readln;
import std.exception : assertThrown;
import std.array; 
import std.string;
import std.path;
import std.uni;
import std.format;
import std.file;


void man(string[] aux,float quantidade){
    if(equal(aux[1],"mkdir")){
        "./manual/".chdir;
        cat(aux); 
        "../".chdir;
    }
}

void mkdir(string[] aux,float quantidade){
    import std.file: mkdir,rmdir;
    import std.algorithm.comparison: equal;
    import std.string;
    for(int i = 1;i < quantidade;i++){
        if(aux[i].exists == true){
            write("Diretorio ja existe,deseja substituir?(s ou n)\n");
            string decisao = readln();
            
            if(equal("s",decisao) == true){
                write("substituição funciona");
                aux[i].rmdir;
                aux[i].mkdir;
            }else if((equal("n",decisao) == true)){
                write("Diretorio foi mantido\n");
            }
            // else{
            //     write("Comando inválido\n");
            // }
        }else{
             write("criar");
             aux[i].mkdir; 
        }
    } 
}

void rmdir(string[] aux,float quantidade){
    for(int i = 1;i < quantidade;i++){
                aux[i].rmdirRecurse;
            } 
}

void mkfile(string[] aux,float quantidade){
    for(int i = 1;i < quantidade - 1;i++){
                if(aux[i].exists == true){
                    write("Arquivo ja existe,deseja substituir?(s ou n)\n");
                    string decisao = readln();

                    if(equal(decisao,"s") == true || equal(decisao,"S") == true){
                        remove(aux[i]);
                        append(aux[i],aux[i+1]); //Caminho, dados do arquivo
                    }
                    else if(equal(decisao,"n") == true || equal(decisao,"N") == true){
                        append(aux[i],aux[i+1]); //Caminho, dados do arquivo
                    }else{
                        write("Comando inválido\n");
                    }
                }else{
                    append(aux[i],aux[i+1]);
                    write("Arquivo foi criado\n");
                }
            }
}

void rmfile(string[] aux,float quantidade){
    for(int i = 1;i < quantidade;i++)
        remove(aux[i]);
}

void cat(string[] aux){
    write(readText(aux[1]),"\n"); 
}

void main(){
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
        string[] aux = parametros.split;
        float quantidade = count(aux);
    
    
        auto dir = deleteme ~ "dir"; 
        auto f = deleteme ~ "f";
        auto target = deleteme ~ "target";

        if(equal(aux[0],"mkdir") == true){
            mkdir(aux,quantidade);
        }
        else if(equal(aux[0],"rmdir") == true){
            rmdir(aux,quantidade); 
        }
        else if(equal(aux[0],"mkfile") == true){
            mkfile(aux,quantidade);
        } 
        else if(equal(aux[0],"rmfile") == true){
            rmfile(aux,quantidade);
        }
        else if(equal(aux[0],"copy") == true){
            write(aux[1],aux[2]);
            copy(aux[1],aux[2]);
        }
        else if(equal(aux[0],"cat") == true){
           cat(aux);
        }
        else if(equal(aux[0],"clear") == true){
            write("\033[H\033[2J");
        }
        else if(equal(aux[0],"cd") == true){
                aux[1].chdir;
        }
        // else if(equal(aux[0],"move"){
            
        // }
        // else if(equal(aux[0],"ls") == 0){
            
        // }
        else if(equal(aux[0],"exit") == true){
            return;
        }
        else if(equal(aux[0],"man")== true){
            man(aux,quantidade);
        }
        else{
            write("Comando não encontrado\n");
        }
    }
}  

