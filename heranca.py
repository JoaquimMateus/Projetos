class animal(object):
    def _init_(self, nome, idade = 1):
        self.nome = nome
        self.idade = idade

    def get_nome(self):
        return self.nome

    def get_idade(self):
        return self.idade

    def set_nome(self, novo_nome):
        self.nome = novo_nome

    def set_idade(self, nova_idade):
        self.idade = nova_idade

    def verifica_idade(self, valor):
        if valor >= 10:
            print("este é um animal adulto")
        else:
            print("este é um animal jovem")



class leao(animal):
    def _init_(self, nome, numero_jaula = 12, idade = 1):
        super()._init_(numero_jaula)
        self.numero_jaula = numero_jaula
        self.nome = nome
        self.idade = idade

    def get_jaula(self):
        return self.numero_jaula
    def set_jaula(self, nova_jaula):
        self.numero_jaula = nova_jaula
    def verifica_territorio(self, area_total):
        self.area_total = area_total
        if area_total >= 50:
            print("leao tem espaço para seu territorio: ")
        else:
            print("leao precisa de mais espaço em seu territorio")
        return area_total

class macaco(animal):
    def _init_(self, nome, idade = 1, tipo_dieta = ''):
        super()._init_(tipo_dieta)
        self.nome = nome
        self.idade = idade
    def exibir_informação(self,):
        print(f"{self.nome:}, {self.idade:}")


if __name__ == '__main__':
    animal1 = animal('carlos')
    print(animal1)
    print(animal1.get_nome())
    leao1 = leao('leo', 14, 4)
    print(leao1)
    print(leao1.get_nome())
    print(leao1.get_jaula())
    print(leao1.set_jaula(18))
    print(leao1.get_jaula())
    print(leao1.verifica_idade(9))
    print(leao1.verifica_idade(11))
    print(leao1.verifica_territorio(50))
    macaco1 = macaco('monkey', 2 )
    print(macaco1)
    print(macaco1.get_nome())
    print(macaco1.exibir_informação())
    print(macaco1.verifica_idade(10))
    print(macaco1.verifica_idade(5))