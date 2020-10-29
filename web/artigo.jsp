<%-- 
    Document   : timeline
    Created on : Oct 8, 2020, 7:31:41 PM
    Author     : genu
--%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="cabecalho.html" />
        <link rel="stylesheet" href="./artigo.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.html" />            
            <section>
                <h1 class="display-4">Título da Notícia</h1>
                <div class="row">
                    <div class="col-12">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat mauris nunc congue nisi vitae. Id semper risus in hendrerit gravida rutrum quisque non tellus. At consectetur lorem donec massa. Quis eleifend quam adipiscing vitae proin sagittis nisl. Condimentum id venenatis a condimentum. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus. Ipsum a arcu cursus vitae congue mauris rhoncus aenean. Pulvinar etiam non quam lacus. Elit at imperdiet dui accumsan sit amet nulla facilisi morbi. Nulla at volutpat diam ut venenatis tellus in metus vulputate. Pretium nibh ipsum consequat nisl vel pretium lectus. Et tortor at risus viverra adipiscing at in. Nunc pulvinar sapien et ligula.

                            Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Nullam ac tortor vitae purus faucibus. Nunc sed blandit libero volutpat sed. Facilisis sed odio morbi quis commodo odio aenean. Dolor purus non enim praesent elementum facilisis leo. Mi tempus imperdiet nulla malesuada pellentesque elit. Ac orci phasellus egestas tellus. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Nisi vitae suscipit tellus mauris a diam. Adipiscing commodo elit at imperdiet. Quis auctor elit sed vulputate mi sit. Laoreet non curabitur gravida arcu ac tortor. Pretium quam vulputate dignissim suspendisse in est ante in nibh. Augue interdum velit euismod in pellentesque massa placerat duis.

                            Ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae. In hendrerit gravida rutrum quisque non tellus. Sit amet venenatis urna cursus eget nunc scelerisque viverra mauris. Convallis aenean et tortor at risus viverra adipiscing at in. Sit amet nulla facilisi morbi tempus iaculis. Enim nec dui nunc mattis enim ut tellus. Id semper risus in hendrerit gravida rutrum quisque non. At imperdiet dui accumsan sit amet nulla facilisi morbi. Ipsum consequat nisl vel pretium lectus quam. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh. Habitant morbi tristique senectus et netus et malesuada fames. Gravida in fermentum et sollicitudin ac orci phasellus.

                            Malesuada fames ac turpis egestas maecenas pharetra convallis posuere. Et odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Vitae justo eget magna fermentum iaculis eu non diam phasellus. Tempor nec feugiat nisl pretium fusce id velit ut tortor. Quis varius quam quisque id diam vel quam elementum pulvinar. In mollis nunc sed id semper risus in. Sed elementum tempus egestas sed sed risus pretium quam vulputate. Rhoncus urna neque viverra justo nec ultrices. Diam vulputate ut pharetra sit amet aliquam id. Magna fermentum iaculis eu non diam phasellus vestibulum lorem sed.

                            Dui nunc mattis enim ut tellus elementum. Dolor morbi non arcu risus quis. Ullamcorper eget nulla facilisi etiam dignissim diam quis enim. Et sollicitudin ac orci phasellus egestas tellus. Mauris pharetra et ultrices neque ornare aenean euismod elementum nisi. Proin sagittis nisl rhoncus mattis rhoncus. Cras pulvinar mattis nunc sed blandit libero. Facilisis volutpat est velit egestas. Tortor dignissim convallis aenean et tortor at risus viverra. Nec dui nunc mattis enim. Cursus metus aliquam eleifend mi in nulla posuere sollicitudin aliquam. Est ullamcorper eget nulla facilisi etiam dignissim diam. Elit sed vulputate mi sit. At varius vel pharetra vel turpis nunc eget lorem. Fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque. Turpis egestas sed tempus urna et pharetra pharetra massa.
                        </p>
                    </div>                                     
                    <div>
                        <div class="m-2 pl-2 pr-2">
                            <h2>Comentários de Nossos Usuários</h2>
                        </div>
                        <% for (int i = 0; i < 2; i += 1) { %>
                        <div class="card-body">                                                        
                            <div class="card card-inner">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
                                            <p class="text-secondary text-center">15 Minutes Ago</p>
                                        </div>
                                        <div class="col-md-10">
                                            <p><a href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman Akash</strong></a></p>
                                            <p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                            <p>
                                                <!--
                                                <a class="float-right btn btn-outline-primary ml-2">  <i class="fa fa-reply"></i> Reply</a>
                                                -->                                                
                                                <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <% }%>                        
                        <div class="m-2 pl-2 pr-2 form-group">
                            <label for="comment">Nos deixe seu comentário</label>
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                        <div class="m-2 pl-2 pr-2">
                            <button type="submit" class="btn btn-outline-dark mr-2">Comentar</button>
                        </div>     
                    </div>
                </div>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./artigo.js"></script>
</html>
