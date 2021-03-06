<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container invoice">
	<h1 class="product-title mb-4" style="margin-top: 120px">Create
		news</h1>
	<br> <br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="name">
				<div class="btn btn-success btn-new_list">
					<a href="<c:url value="/news-list-management" />">List News
						Management</a>
				</div>
			</div>
			<br>
			<c:url value="/saveNews" var="saveNews" />
			<form:form action="${saveNews}" method="POST" modelAttribute="news"
				id="formsave">
				<b>Title</b>
				<form:input path="title" class="form-control" />
				<br />
				<br />

				<b>Content</b>
				<form:input path="content" class="form-control" rows="5" />
				<br />
				<br />

				<b>Image Link</b>
				<form:input path="image" class="form-control" rows="5" />
				<br />
				<br />
				<button class="btn btn-primary">Done</button>
			</form:form>
		</div>
		<div class="col-md-1"></div>
	</div>
	<br> <br> <br> <br>
</div>

