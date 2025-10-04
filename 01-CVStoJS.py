import pandas as pd
import json

# Carrega o arquivo CSV
df = pd.read_csv('dados.csv', sep=';', encoding='utf-8', on_bad_lines='skip')

# Limpa espaços e caracteres invisíveis de todas as colunas
for col in df.columns:
    df[col] = df[col].astype(str).str.replace(r'[\t\n\r]', '', regex=True).str.strip()

# Substitui NaN por None
df = df.where(pd.notnull(df), None)

# Converte para lista de dicionários
dados = df.to_dict(orient='records')

# Gera o arquivo JS
with open('dados1.js', 'w', encoding='utf-8') as f:
    f.write('const pacientes = ')
    json_content = json.dumps(dados, ensure_ascii=False, indent=4)
    f.write(json_content)
    f.write(';')