# scp-rails
Sistema de Controle de Projetos de Pesquisa

## Instalação

Antes de qualquer coisa atualizar o sistema para evitar problemas futuros:

```console
sudo apt-get update
```

```console
sudo apt-get upgrade
```

Instalar alguns pacotes de dependências

```console
sudo apt-get install build-essential libmysqlclient-dev libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3 imagemagick
```

Verificar a versão stable do ruby: https://www.ruby-lang.org/en/downloads/ e fazer o download via wget

Alterar esse link sempre que tiver nova versão (a versão 2.2.1 tava falhando no comando make, caso falhar pegar a versão stable anterior)

```console
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz
```

```console
tar -xzf ruby-2.1.5.tar.gz
```

```console
cd ruby-2.1.5
```

```console
./configure
```

```console
make
```

```console
sudo make install
```

Verificar a versão do ruby

```console
ruby -v
```

Se tiver tudo ok, remover os arquivos de instalação do ruby

```console
cd ..
```

```console
rm -rf ~/ruby-2.1.5
```

```console
rm ruby-2.1.5.tar.gz
```

Adicionar as chaves para download da última versão do NGINX

```console
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
```

Editar o arquivo de source do apt-get

```console
sudo nano /etc/apt/sources.list
```

No final do arquivo colocar

```console
deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main
```

Atualizar os pacotes e instalar o NGINX e Passenger

```console
sudo apt-get update
```

```console
sudo apt-get install nginx-extras passenger
```

Com isso algumas vezes as dependencias serão instaladas e sobreescreverá nossa versão do Ruby, assim precisamos voltar a versão atualizando o bin do ruby.

Verificar novamente a versão do ruby

```console
ruby -v
```

Se alterou para alguma versão anterior fazer os passos a seguir:

```console
sudo rm /usr/bin/ruby
```

```console
sudo ln -s /usr/local/bin/ruby /usr/bin/ruby
```

Feito isso precisamos criar a pasta onde ficará nossa aplicação:

```console
mkdir ~/app
```

Editar o arquivo /etc/nginx/nginx.conf

```console
sudo nano /etc/nginx/nginx.conf
```

Nas linhas onde estiver o código abaixo, descomentar as linhas tirando o '#'

```nginx
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /usr/bin/ruby;
```

Editar o arquivo /etc/nginx/sites-enabled/default

```console
sudo nano /etc/nginx/sites-enabled/default
```

Comentar o bloco server existente e adicionar esse abaixo, trocando seuusuario pelo seu Usuário e colocando o IP do seu servidor no server_name:

```nginx
server {
  listen 80;

  root /home/seuusuario/app/scp/current/public;
  passenger_enabled on;
  passenger_app_env production;

  # Make site accessible from the IP
  server_name 192.168.103.208;

}
```

Feito isso, reiniciar o nginx

```console
sudo service nginx restart
```

Instalar o bundler responsável pelas dependências do projeto

```console
sudo gem install bundler
```

Instalar o banco de dados a ser utilizado

```console
sudo apt-get install mysql-server
```

Colocar a senha para o root etc, entrar no prompt do mysql executando o comando abaixo e colocando a senha do mysql

```console
mysql -p -u root
```

Criar o banco de dados da aplicação

```sql
CREATE DATABASE  scp;
```

Para sair do console digite: `\q`

Agora faremos a publicação da aplicação no servidor via Capistrano.
Na sua máquina com o projeto clonado, deverá atualizar o IP de deploy no arquivo e o usuário que está sendo utilizado.

```console
nano config/deploy/production.rb
```

```ruby
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{usuario@xxx.xxx.xxx.xxx}
role :web, %w{usuario@xxx.xxx.xxx.xxx}
role :db,  %w{usuario@xxx.xxx.xxx.xxx}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'xxx.xxx.xxx.xxx', user: 'usuario', roles: %w{web app}
```

Depois atualizar o arquivo, colocando o caminho correto da pasta app

```console
nano config/deploy.rb
```

```ruby
set :application, 'scp'
set :repo_url, 'https://github.com/ifrsfeliz/moodle-alunos.git'

set :deploy_to, '/home/ticpfeliz/app/scp' #ALTERAR AQUI!!!! /home/nomedoseuusuario/app/scp

set :linked_files, %w{config/database.yml config/secrets.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
```


Executar o comando, ele executará, criará umas pastas e **dará erro que o arquivo config/database.yml está faltando**

```console
cap production deploy
```

No servidor criar o arquivo database.yml na pasta shared

```console
nano ~/app/scp/shared/config/database.yml
```

e colocar os dados das conexões dos bancos:

```yaml
production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: scp
  username: root
  password: 'suasenha'
  pool: 5
  host: localhost
  port: 3306

```

Criar o arquivo settings.yml e secrets.yml colocando uma chave secreta no ambiente de produção, como exemplo, (ALTERAR, não deixar a mesma!)

```console
nano ~/app/scp/shared/config/settings.yml
```

Dados do arquivo settings.yml deve ser alterado para suas necessidades, esse é p padrão
```yaml
defaults: &defaults
  gmail_username: contadogmailqueenviaraemail@seudominio.edu.br
  gmail_password: "senhadoemail"
  email_report_managers:
    - emailDoSetorQueReceberaAsNotificacoes@ifrs.edu.br

development:
  <<: *defaults

test:
  <<: *defaults

production:
  <<: *defaults
```


```console
nano ~/app/scp/shared/config/secrets.yml
```

Dados do arquivo secrets.yml

```yaml
production:
  secret_key_base: b38c6d5ef3c8048bea9a41ff4ea20676e505404e973446c3efc9d281fe65acaab402f85547f8c16e65b870b900448a21365ad48977d642cd5b85616a1bd7382b
```

Voltar a máquina local e executar o comando para deploy da aplicação:

```console
cap production deploy
```

Isso fará deploy, fará o bundle, compilará os assets e executará migrações no banco.
Para criar o usuário admin da aplicação é necessário entrar no servidor e ir na pasta da aplicação atual e executar o rake db:seed como segue abaixo:

```console
cd ~/app/scp/current
bundle exec rake db:seed RAILS_ENV=production
```

Caso seja necessário reiniciar o nginx, é possível da pasta do projeto executar:

```console
cap production deploy:restart
```

Para auxílio sti@feliz.ifrs.edu.br
