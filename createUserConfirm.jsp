<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/form.css">
<link rel="stylesheet" href="./css/table.css">
<title>ユーザー情報入力確認画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="contents">
		<h1>ユーザー情報入力確認画面</h1>
	</div>

	<table class="vertical-list">
		<tr>
			<th><s:label value="姓" /></th>
			<td><div class="property">
					<s:property value="#session.familyName" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="名" /></th>
			<td><div class="property">
					<s:property value="#session.firstName" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="姓ふりがな" /></th>
			<td><div class="property">
					<s:property value="#session.familyNameKana" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="名ふりがな" /></th>
			<td><div class="property">
					<s:property value="#session.firstNameKana" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="性別" /></th>
			<td><div class="property">
					<s:property value="#session.sex" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="メールアドレス" /></th>
			<td><div class="property">
					<s:property value="#session.email" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="ユーザーID" /></th>
			<td><div class="property">
					<s:property value="#session.userIdForCreateUser" />
				</div></td>
		</tr>
		<tr>
			<th><s:label value="パスワード" /></th>
			<td><div class="property">
					<s:property value="concealedPassword" />
				</div></td>
		</tr>
		<s:hidden name="password" />

	</table>

	<!--backFlgで値の保持  -->

	<s:form action="CreateUserCompleteAction">
		<div class="submit_button">
			<s:submit class="button" value="登録" />
		</div>
	</s:form>

	<s:form action="CreateUserAction">
		<div class="submit_button">
			<s:hidden name="backFlg" value="ok" />
			<s:submit class="button" value="戻る" />
		</div>
	</s:form>
</body>
</html>