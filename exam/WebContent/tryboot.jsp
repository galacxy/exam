Navigation Bar

<div class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-responsive-collapse">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Brand</a>
	</div>
	<div class="navbar-collapse collapse navbar-responsive-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Active</a></li>
			<li><a href="#">Link</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">Dropdown <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li class="dropdown-header">Dropdown header</li>
					<li><a href="#">Separated link</a></li>
					<li><a href="#">One more separated link</a></li>
				</ul></li>
		</ul>
		<form class="navbar-form navbar-left">
			<input type="text" class="form-control col-lg-8" placeholder="Search">
		</form>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">Link</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">Dropdown <b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li><a href="#">Separated link</a></li>
				</ul></li>
		</ul>
	</div>
</div>

Tables

<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>#</th>
			<th>Column heading</th>
			<th>Column heading</th>
			<th>Column heading</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr>
			<td>2</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr class="info">
			<td>3</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr class="success">
			<td>4</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr class="danger">
			<td>5</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr class="warning">
			<td>6</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
		<tr class="active">
			<td>7</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
		</tr>
	</tbody>
</table>

Form

<form class="form-horizontal">
	<fieldset>
		<legend>Legend</legend>
		<div class="form-group">
			<label for="inputEmail" class="col-lg-2 control-label">Email</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" id="inputEmail"
					placeholder="Email">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-lg-2 control-label">Password</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="inputPassword"
					placeholder="Password">
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="textArea" class="col-lg-2 control-label">Textarea</label>
			<div class="col-lg-10">
				<textarea class="form-control" rows="3" id="textArea"></textarea>
				<span class="help-block">A longer block of help text that
					breaks onto a new line and may extend beyond one line.</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-2 control-label">Radios</label>
			<div class="col-lg-10">
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios1" value="option1" checked=""> Option one
						is this
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios2" value="option2"> Option two can be
						something else
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="select" class="col-lg-2 control-label">Selects</label>
			<div class="col-lg-10">
				<select class="form-control" id="select">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select> <br> <select multiple="" class="form-control">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-10 col-lg-offset-2">
				<button class="btn btn-default">Cancel</button>
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</fieldset>
</form>

Tabs

<ul class="nav nav-tabs">
	<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
	<li><a href="#profile" data-toggle="tab">Profile</a></li>
	<li class="disabled"><a>Disabled</a></li>
	<li class="dropdown"><a class="dropdown-toggle"
		data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
	</a>
		<ul class="dropdown-menu">
			<li><a href="#dropdown1" data-toggle="tab">Action</a></li>
			<li class="divider"></li>
			<li><a href="#dropdown2" data-toggle="tab">Another action</a></li>
		</ul></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade active in" id="home">
		<p>Raw denim you probably haven't heard of them jean shorts
			Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse.
			Mustache cliche tempor, williamsburg carles vegan helvetica.
			Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby
			sweater eu banh mi, qui irure terry richardson ex squid. Aliquip
			placeat salvia cillum iphone. Seitan aliquip quis cardigan american
			apparel, butcher voluptate nisi qui.</p>
	</div>
	<div class="tab-pane fade" id="profile">
		<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla
			single-origin coffee squid. Exercitation +1 labore velit, blog
			sartorial PBR leggings next level wes anderson artisan four loko
			farm-to-table craft beer twee. Qui photo booth letterpress, commodo
			enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum
			PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus
			mollit.</p>
	</div>
	<div class="tab-pane fade" id="dropdown1">
		<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they
			sold out mcsweeney's organic lomo retro fanny pack lo-fi
			farm-to-table readymade. Messenger bag gentrify pitchfork tattooed
			craft beer, iphone skateboard locavore carles etsy salvia banksy
			hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid
			8-bit cred pitchfork.</p>
	</div>
	<div class="tab-pane fade" id="dropdown2">
		<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy
			art party before they sold out master cleanse gluten-free squid
			scenester freegan cosby sweater. Fanny pack portland seitan DIY, art
			party locavore wolf cliche high life echo park Austin. Cred vinyl
			keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table
			VHS viral locavore cosby sweater.</p>
	</div>
</div>

Pager

<ul class="pager">
	<li><a href="#">Previous</a></li>
	<li><a href="#">Next</a></li>
</ul>

<ul class="pager">
	<li class="previous disabled"><a href="#">← Older</a></li>
	<li class="next"><a href="#">Newer →</a></li>
</ul>

Pagination

<ul class="pagination">
	<li class="disabled"><a href="#">«</a></li>
	<li class="active"><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">»</a></li>
</ul>

<ul class="pagination pagination-lg">
	<li class="disabled"><a href="#">«</a></li>
	<li class="active"><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">»</a></li>
</ul>

<ul class="pagination pagination-sm">
	<li class="disabled"><a href="#">«</a></li>
	<li class="active"><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">»</a></li>
</ul>


Progress Bars

<div class="progress progress-striped active">
	<div class="progress-bar" style="width: 45%"></div>
</div>

Dialogs Modal
<div class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">Modal title</h4>
			</div>
			<div class="modal-body">
				<p>One fine body…</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>

		panel

		<div class="panel panel-default">
			<div class="panel-body">Basic panel</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">Panel heading</div>
			<div class="panel-body">Panel content</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-body">Panel content</div>
			<div class="panel-footer">Panel footer</div>
		</div>

		List Groups

		<ul class="list-group">
			<li class="list-group-item"><span class="badge">14</span> Cras
				justo odio</li>
			<li class="list-group-item"><span class="badge">2</span> Dapibus
				ac facilisis in</li>
			<li class="list-group-item"><span class="badge">1</span> Morbi
				leo risus</li>
		</ul>
	</div>
</div>