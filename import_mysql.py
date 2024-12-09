import mysql.connector

def connection():
    conexao = mysql.connector.connect(user='root',
                                      password='',
                                      host='127.0.0.1')
    print("Conexão db", conexao)
    return conexao

def create_db():
    db_create = "CREATE DATABASE IF NOT EXISTS db_prova"
    cursor.execute(db_create)
    use_db = "use db_prova"
    cursor.execute(use_db)

def create_table():
    sql = """CREATE TABLE IF NOT EXISTS tb_livro(
                idt INT NOT NULL AUTO_INCREMENT,
                titulo VARCHAR(80) NOT NULL UNIQUE,
                PRECO CHAR(2),
                editora VARCHAR(80),
                PRIMARY KEY(idt))
    """
    cursor.execute(sql)
    conexao.commit()

def consulta_livro():
    titulo = input("Digite o titulo do livro: ")
    select = f""" SELECT * FROM tb_livro 
                    WHERE (f'{titulo}')
    """
    cursor.execute(select)


if __name__=='main_':
    conexao = connection()
    cursor = conexao.cursor()
    create_db()
    create_table()
    consulta_livro()