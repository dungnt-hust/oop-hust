<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url value="/user-save" var="urlSave" />
<c:url value="/user-view" var="urlView" />
<c:url value="/user-list" var="urlList" />
<c:url value="/user-update" var="urlUpdate" />
<c:url value="/user-restore" var="urlRestore" />
<c:url value="/userDelete" var="urlDelete" />
<c:url value="0" var="count" />

<div id="news-post" class="container">
	<div style="margin-left: 65px;" class="col-11">
		<div style="margin-top: 150px;">
			<h1 class="product-title mb-4">Garbage</h1>
			<br> <br> <br>
			<div class="add_user btn btn-success">
				<a href="${urlList}">List user</a>
			</div>
			<br> <br> <br>
			<table class="table table-striped">
				<tr>
					<th>Id</th>
					<th>Name <a href="user-list-deleted?sort=name"><svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-sort-alpha-down"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M10.082 5.629 9.664 7H8.598l1.789-5.332h1.234L13.402 7h-1.12l-.419-1.371h-1.781zm1.57-.785L11 2.687h-.047l-.652 2.157h1.351z" />
  <path
									d="M12.96 14H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V14zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z" />
</svg></a>
					</th>
					<th>MSSV <a href="user-list-deleted?sort=mssv"><svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-sort-alpha-down"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M10.082 5.629 9.664 7H8.598l1.789-5.332h1.234L13.402 7h-1.12l-.419-1.371h-1.781zm1.57-.785L11 2.687h-.047l-.652 2.157h1.351z" />
  <path
									d="M12.96 14H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V14zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z" />
</svg></a></th>
					<th>Role <a href="user-list-deleted?sort=role"><svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-sort-alpha-down"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M10.082 5.629 9.664 7H8.598l1.789-5.332h1.234L13.402 7h-1.12l-.419-1.371h-1.781zm1.57-.785L11 2.687h-.047l-.652 2.157h1.351z" />
  <path
									d="M12.96 14H9.028v-.691l2.579-3.72v-.054H9.098v-.867h3.785v.691l-2.567 3.72v.054h2.645V14zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z" />
</svg></a></th>
					<th>View</th>
					<th>Restore</th>
					<th>Delete</th>
				</tr>
				<c:if test="${not empty listUser}">
					<c:forEach var="user" items="${listUser}">
						<tr style="border: 1px black solid">
							<td>${count = count + 1}</td>
							<td><img src="${user.image}" class="card-img-top" alt="..."
								style="width: 55px; height: auto;">${user.name}</td>
							<td>${user.mssv}</td>
							<td>${user.getRole()}</td>
							<td><a href="${urlView}/${user.id}/${user.username}"><i
									class="fas fa-eye"></i></a></td>
							<td><a href="${urlRestore}/${user.id}"><i
									class="fas fa-trash-restore"></i></a></td>
							<td><a href="${urlDelete}/${user.id}"><i
									class="far fa-trash-alt"></i></a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<br> <br> <br>
		</div>
	</div>
</div>