import std.algorithm.comparison;
import std.stdio: write, writeln, writef, writefln , fscanf, readln,readf;
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
    for(int i = 1;i < quantidade;i++){
        if(aux[i].exists == true){
            write("Diretorio ja existe,deseja substituir?(s ou n)\n");
            string decisao = readln();
            
            if(equal(decisao,"s\x0a") == true || equal(decisao,"S\x0a") == true){
                write("substituição funciona");
                aux[i].rmdirRecurse;
                aux[i].mkdirRecurse;
            }else if((equal(decisao,"n\x0a") == true || equal(decisao,"N\x0a") == true)){
                write("Diretorio foi mantido\n");
            }
            else{
                write("Comando inválido\n");
            }
        }else{
             write("criar");
             aux[i].mkdirRecurse; 
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

                    if(equal(decisao,"s\x0a") == true || equal(decisao,"S\x0a") == true){
                        remove(aux[i]);
                        append(aux[i],aux[i+1]); //Caminho, dados do arquivo
                    }
                    else if(equal(decisao,"n\x0a") == true || equal(decisao,"N\x0a") == true){
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

void cpy(string[] aux,float quantidade){
    // string caminho = getcwd();
    // aux[2].chdir;
    // string caminho_arquivo = join([aux[2],aux[1]]);
    // write(caminho_arquivo);

    for(int i = 1; i < quantidade - 1;i++){
        //copiar arquivos
        if(aux[i].isFile == true){
            if(aux[i+1].exists == true){
                write("Arquivo ja existe,deseja substituir?(s ou n)\n");            
                string decisao = readln();
                
                if(equal(decisao,"s\x0a") == true || equal(decisao,"S\x0a") == true){
                    write("substituiu");
                    remove(aux[i+1]);
                    copy(aux[i],aux[i+1]); //nome arquivo, destino 
                }
                else if(decisao == "n\x0a")
                    write("Arquivo foi mantido");
            }else{
                append(aux[i+1],null);
                copy(aux[i],aux[i+1]);
            }
        }
        //copia diretórios = encontrar função
        else if(aux[i].isDir == true){

        }
    }
        
                    
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
        string[] aux = parametros.split;
        float quantidade = count(aux);
    
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
            cpy(aux,quantidade);
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

