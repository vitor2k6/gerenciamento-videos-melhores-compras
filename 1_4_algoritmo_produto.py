# 1_4_algoritmo_produto.py
import json


def get_icms(valor_produto):
    """
    Função lambda para calcular o valor do ICMS.
    """
    return (lambda valor: valor * 0.18)(valor_produto)


def cadastrar_produtos():
    """
    Algoritmo para cadastrar produtos, calcular ICMS e gerar um arquivo JSON.
    """
    produtos = []

    while True:
        try:
            descricao = input("Digite a descrição do produto: ")

            while True:
                try:
                    valor = float(input("Digite o valor do produto: "))
                    if valor < 0:
                        print("O valor do produto não pode ser negativo. Tente novamente.")
                        continue
                    break
                except ValueError:
                    print("Entrada inválida. Por favor, digite um valor numérico.")

            tipo_embalagem = input("Digite o tipo de embalagem: ")

            icms = get_icms(valor)

            produto = {
                "descricao": descricao,
                "valor_produto": valor,
                "tipo_embalagem": tipo_embalagem,
                "icms": round(icms, 2)
            }

            produtos.append(produto)

            print(f"Produto '{descricao}' cadastrado com sucesso!")

            resposta = input("Deseja cadastrar um novo produto? (s/n): ").lower()
            if resposta != 's':
                break

        except Exception as e:
            print(f"Ocorreu um erro genérico: {e}. Tente novamente.")

    # Certificar que há no mínimo 5 produtos antes de gerar o arquivo
    if len(produtos) < 5:
        print(
            f"Número de produtos insuficiente ({len(produtos)}). É necessário ter pelo menos 5 produtos para gerar o arquivo.")
    else:
        file_name = "1_5_arquivo_produto.json"
        with open(file_name, 'w', encoding='utf-8') as f:
            json.dump(produtos, f, ensure_ascii=False, indent=4)
        print(f"Arquivo '{file_name}' gerado com sucesso!")


# Execução do algoritmo
if __name__ == "__main__":
    cadastrar_produtos()