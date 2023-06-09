<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script>
        function check(){
            if(document.frm.PW.value==""){
                alert("비밀번호를 입력해주세요.");
                document.frm.PW.focus();
                return false;
            }
            if(document.frm.rePW.value==""){
                alert("비밀번호를 한 번 더 입력해주세요.");
                document.frm.rePW.focus();
                return false;
            }
            if(document.frm.PW.value != document.frm.rePW.value){
                alert("비밀번호가 일치하지 않습니다.")
                document.frm.rePW.focus();
                return false;
            }
            document.frm.submit()
        }
        
    </script>
</head>
<body>
    <%@ include file="header.jsp"%>
    <%@ include file="nav.jsp"%>
    <section>
        <%@ include file="dbconn.jsp" %>
    <%
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        String ID=request.getParameter("ID");
        String sql="select id, name, password, gender, birthday, phone, email, address, interest from member where id=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, ID);
        rs=pstmt.executeQuery();
        if(rs.next()){
            String name=rs.getString("name");
            String birth=rs.getString("birthday");
            String bir[]=birth.split("-");
            //
            String birthY=birth.substring(0,4);
            String birthM=birth.substring(5,7);
            String birthD=birth.substring(8,10);
            String email=rs.getString("email");
            String em[]=email.split("@");
            String phone=rs.getString("phone");
            String ph[]=phone.split("-");
            String PW=rs.getString("password");
            String address=rs.getString("address");
            String gender=rs.getString("gender");
            String interest=rs.getString("interest");
            String inter[]=interest.split(",");
            
    %>
    <hr>
        <h1>회원 정보 수정 화면</h1>    
        <form name="frm" method="get" action="memberUpdateProcess.jsp">
            <table border="1" id="tab1">
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="ID" id="in1" placeholder="숫자만 입력하세요" value="<%=ID%>"></td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" name="name" id="in1" value="<%=name%>"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="PW" id="in1" value="<%=PW%>"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="rePW" id="in1"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <input type="radio" name="gender" value="남성" <%=gender.equals("남성")?"checked":"" %>> 남성
                        <input type="radio" name="gender" value="여성" <%=gender.equals("여성")?"checked":"" %>> 여성
                    </td>
                </tr>
                <tr>
                    <td>생일</td>
                    <td>
                        <input type="text" name="birthY" id="in3" value="<%=birthY%>">년
                        <input type="text" name="birthM" id="in3" value="<%=birthM%>">월
                        <input type="text" name="birthD" id="in3" value="<%=birthD%>">일
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="emailId" id="in1" value="<%=em[0]%>">@
                        <input type="text" name="emailAd" id="in1" value="<%=em[1]%>">
                    </td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>
                        <input type="text" name="phone1" id="in3" value="<%=ph[0]%>">-
                        <input type="text" name="phone2" id="in3" value="<%=ph[1]%>">-
                        <input type="text" name="phone3" id="in3" value="<%=ph[2]%>">
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="address" id="in2" value="<%=address%>"></td>
                </tr>
                <tr>
                    <td>관심분야</td>
                    <td>
                        <input type="checkbox" name="interest" value="프로그램" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("프로그램")) out.print("checked"); %>>프로그램
                        <input type="checkbox" name="interest" value="독서" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("독서")) out.print("checked"); %>>독서
                        <input type="checkbox" name="interest" value="등산" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("등산")) out.print("checked"); %>>등산
                        <input type="checkbox" name="interest" value="여행" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("여행")) out.print("checked"); %>>여행
                        <input type="checkbox" name="interest" value="컴퓨터" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("컴퓨터")) out.print("checked"); %>>컴퓨터
                        <input type="checkbox" name="interest" value="영화" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("영화")) out.print("checked"); %>>영화
                        <input type="checkbox" name="interest" value="운동" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("운동")) out.print("checked"); %>>운동
                        <input type="checkbox" name="interest" value="진학" <%for(int i=0;i<inter.length;i++)if(inter[i].equals("진학")) out.print("checked"); %>>진학
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button"  id="btn" value="수정" onclick="check()">
                        <input type="reset"  id="btn" value="취소">
                    </td>
                </tr>
            </table>
            <%
        }
            %>
        </form>
    </hr>
    </section>
    <%@ include file="footer.jsp"%>
</body>
</html>