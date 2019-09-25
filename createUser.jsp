<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/error.css">
<link rel="stylesheet" href="./css/table.css">
<link rel="stylesheet" href="./css/form.css">
<title>ユーザー情報入力画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="contents">
		<h1>ユーザー情報入力画面</h1>
	</div>
	<!-- ConfirmAction内での書式確認用 -->
	<s:if
		test="familyNameErrorMessageList!=null&& familyNameErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="familyNameErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>

	<s:if
		test="firstNameErrorMessageList!=null&& firstNameErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="firstNameErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>

	<s:if
		test="familyNameKanaErrorMessageList!=null&& familyNameKanaErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="familyNameKanaErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>

	<s:if
		test="firstNameKanaErrorMessageList!=null&& firstNameKanaErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="firstNameKanaErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>
	<s:if
		test="emailErrorMessageList!=null&& emailErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="emailErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>

	<s:if
		test="userIdErrorMessageList!=null&& userIdErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="userIdErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>

	<s:if
		test="passwordErrorMessageList!=null&& passwordErrorMessageList.size()>0">
		<div class="error">
			<div class="error-message">
				<s:iterator value="passwordErrorMessageList">
					<s:property />
					<br>
				</s:iterator>
			</div>
		</div>
	</s:if>
	<s:if test="checkExistsUserErrorMessage !=null">
		<div class="error">
			<div class="error-message">
				<s:property value="checkExistsUserErrorMessage" />
			</div>
		</div>
	</s:if>

	<s:form action="CreateUserConfirmAction">
		<table class="vertical-list">
			<tr>
				<th><s:label value="姓" /></th>
				<td><s:textfield name="familyName"
						value="%{#session.familyName}" placeholder="姓" class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="名" /></th>
				<td><s:textfield name="firstName" value="%{#session.firstName}"
						placeholder="名" class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="姓ふりがな" /></th>
				<td><s:textfield name="familyNameKana"
						value="%{#session.familyNameKana}" placeholder="姓ふりがな"
						class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="名ふりがな" /></th>
				<td><s:textfield name="firstNameKana"
						value="%{#session.firstNameKana}" placeholder="名ふりがな" class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="性別" /></th>
				<td><div class="property">
						<s:radio name="sex" list="%{#session.sexList}"
							value="%{#session.sex}" />
					</div></td>
			</tr>
			<tr>
				<th><s:label value="メールアドレス" /></th>
				<td><s:textfield name="email" value="%{#session.email}"
						placeholder="メールアドレス" class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="ユーザーID" /></th>
				<td><s:textfield name="userId"
						value="%{#session.userIdForCreateUser}" placeholder="ユーザーID"
						class="form" /></td>
			</tr>
			<tr>
				<th><s:label value="パスワード" /></th>

				<td><s:password name="password" value="" placeholder="パスワード"
						class="form" /></td>
			</tr>
		</table>
		<div class="submit_button">
			<s:submit class="button" value="確認" />
		</div>

	</s:form>

</body>
</html>