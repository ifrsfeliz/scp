[![Code Climate](https://codeclimate.com/github/ifrsfeliz/scp-rails/badges/gpa.svg)](https://codeclimate.com/github/ifrsfeliz/scp-rails)
[![Test Coverage](https://codeclimate.com/github/ifrsfeliz/scp-rails/badges/coverage.svg)](https://codeclimate.com/github/ifrsfeliz/scp-rails/coverage)
[![Issue Count](https://codeclimate.com/github/ifrsfeliz/scp-rails/badges/issue_count.svg)](https://codeclimate.com/github/ifrsfeliz/scp-rails)

# Sistema de Controle de Projetos de Pesquisa (rails)

**Baixar o projeto, descompactar e fazer as alterações abaixo**

Considerando que o usuário seja chamado de `deploy`, se não for chamado onde houver ocorrências `deploy` substituir pelo usuário atual.

Por questões de padrões de segurança, não ser o root

```console
  mkdir ~/app
  sudo apt-get install git-core

  git clone https://github.com/ifrsfeliz/scp-rails.git ~/app/scp
  cd ~/app/scp
```

#### Imagens Customizadas

Na pasta do projeto `~/app/scp`, deverão ser trocadas imagens que referenciam os campus:

As imagens podem ser vistas aqui: https://github.com/ifrsfeliz/scp-rails/tree/master/app/assets/images

Na pasta: app/assets/images trocar as três imagens necessárias:

* **logo.png** - logo do campus (276x100px)
* **email-header.png** - cabeçalho do e-mail (600x129px)
* **mid-logo.png** - logo do departamento ou o que preferirem (157x100px)

#### Usuário Administrador

Alterar a linha abaixo do arquivo `db/seeds.rb` com o e-mail, senha e confirmação de senha que desejarem.

Este será o Administrador do Sistema

```ruby
u = User.new(:email => "sti@feliz.ifrs.edu.br", :password => '12345678', :password_confirmation => '12345678')
```

```console
nano db/seeds.rb
```

## Instalação no Ubuntu

Antes de qualquer coisa atualizar o sistema:

```console
sudo apt-get update
```

```console
sudo apt-get upgrade
```

Instalar alguns pacotes de dependências

```console
sudo apt-get install build-essential libmysqlclient-dev libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3 imagemagick apt-transport-https ca-certificates libgmp3-dev
```

```console
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable
```

Colocar no final do arquivo `~/.bash_profile` no diretório home do usuário exemplo. **PERCEBA O USUÁRIO (deploy), mudar se for o caso**

```console
  source /home/deploy/.rvm/scripts/rvm
```

```console
  nano ~/.bash_profile
```

Feito isso saia do terminal atual

```console
  exit
```

**Acesse novamente o servidor, assim ele irá carregar (fazer o source do RVM) que foi colocado no final do arquivo do .bash_profile**

Instalar a versão estável do ruby, a atual é 2.2.3 (pode verificar a versão estável aqui: https://www.ruby-lang.org/en/downloads/)

Ao executar o rvm install, se houver mais dependências, será pedida a senha para executar comandos sudos

```console
rvm install 2.3.0
rvm use 2.3.0 --default
```


Verificar a versão do ruby, se está a versão correspondente.

```console
ruby -v
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


Verificar onde está instalado o ruby para colocar dentro do arquivo `nginx.conf` (nos próximos passos) através do comando:

```console
passenger-config --ruby-command
```

Copiar a localização referente ao `Command`, exemplo do output:

```console
passenger-config was invoked through the following Ruby interpreter:
Command: /home/deploy/.rvm/gems/ruby-2.3.0/wrappers/ruby
Version: ruby 2.3.0 (2015-08-18 revision 51636) [x86_64-linux]
To use in Apache: PassengerRuby /home/deploy/.rvm/gems/ruby-2.3.0/wrappers/ruby
To use in Nginx : passenger_ruby /home/deploy/.rvm/gems/ruby-2.3.0/wrappers/ruby
To use with Standalone: /home/deploy/.rvm/gems/ruby-2.3.0/wrappers/ruby /usr/bin/passenger start
```

Editar o arquivo /etc/nginx/nginx.conf

```console
sudo nano /etc/nginx/nginx.conf
```

Nas linhas onde estiver o código abaixo, descomentar as linhas tirando o '#', no passenger_ruby colocar a localização copiada do `Command`

```nginx
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /home/deploy/.rvm/gems/ruby-2.3.0/wrappers/ruby;
```

Editar o arquivo /etc/nginx/sites-enabled/default

```console
sudo nano /etc/nginx/sites-enabled/default
```

Comentar o bloco server existente e adicionar esse abaixo, trocando seuusuario pelo seu Usuário e colocando o IP do seu servidor no server_name:

```nginx
server {
  listen 80;

  root /home/seuusuario/app/scp/public;
  passenger_enabled on;
  passenger_app_env production;

  # Make site accessible from the IP
  server_name 192.168.103.208;

}
```

Feito isso, reiniciar o nginx se tudo estiver correto reiniciará sem falhas [ok]

```console
sudo service nginx restart
```

Instalar o banco de dados a ser utilizado

```console
sudo apt-get install mysql-server
```

Entrar na pasta do projeto e executar os comandos para instalar as bibliotecas do projeto e compilar os assets:

```console
  cd ~/app/scp
  echo "gem: --no-ri --no-rdoc" > ~/.gemrc
  gem install bundler
  bundle install
```

Para a configuração da aplicação todos os dados obrigatórios ficam no arquivo `.env.production`, para isso basta copiar o arquivo `.env.example` e fazer as alterações necessárias.

```console
cp ~/app/scp/.env.example ~/app/scp/.env.production
```

Depois de copiar o arquivo, abrir o arquivo `.env.production` e fazer as alterações necessárias seguindo as instruções que dentro estão.


Se tudo estiver certo o comando abaixo, irá criar as tabelas de usuário e funções e também popular o usuário administrador configurado no início.

```console
rake db:setup RAILS_ENV=production
```

Para testar se as credenciais do e-mail estão corretas e se enviará o e-mail (cuidar que pode ser permissão no firewall também), mostrará erro se houver falhas.

Quando executar esse comando utilizando uma conta nova do Gmail, poderá causar uma exception, terá de logar na conta e habilitar a opção: "Permitir apps menos seguras". Link para auxilio: https://support.google.com/accounts/answer/6010255?hl=pt-BR

```console
rake system:testar_envio_de_email RAILS_ENV=production
```

Isso criará as tarefas no crontab para disparo de e-mail a cada 2 horas (normalmente são disparados ao virar o dia - 00:00)
```console
whenever -w
```

**ISSO É MUITO IMPORTANTE:** o comando abaixo faz a compilação dos javascript, css e imagens. Então toda vez que uma imagem for trocada deve ser re-executado o comando abaixo, caso contrário não surtirá efeito.

```console
rake assets:precompile RAILS_ENV=production
```


A partir disso é para estar funcionando, caso houver dúvidas, não existe em nos comunicar.

Para auxílio sti@feliz.ifrs.edu.br

# Para atualização do SCP, quando houverem funcionalidades extras

Basta entrar na pasta do projeto e executar os comandos

```console
cd ~/app/scp

git pull

bundle install

rake db:migrate RAILS_ENV=production

rm -rf public/assets

rake assets:precompile RAILS_ENV=production

whenever -c

whenever -w

sudo service nginx restart

```
