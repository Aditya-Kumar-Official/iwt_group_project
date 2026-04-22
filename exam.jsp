<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.exam.util.DBConnection" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<title>Exam</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
</head>

<body class="exam-page">

<%
/* ===== HANDLE QID FROM URL ===== */
String qParam = request.getParameter("qid");

Integer qid;

if(qParam != null){
    qid = Integer.parseInt(qParam);
    session.setAttribute("qid", qid);
} else {
    qid = (Integer)session.getAttribute("qid");
    if(qid == null) qid = 1;
}

/* ===== ANSWER STORAGE ===== */
Map<Integer,String> answers =
(Map<Integer,String>)session.getAttribute("answers");

if(answers == null){
    answers = new HashMap<>();
}

/* ===== HANDLE FORM ACTION ===== */
String action = request.getParameter("action");
String ans = request.getParameter("ans");

/* SAVE ANSWER */
if(ans != null){
    answers.put(qid, ans);
}

/* NAVIGATION */
if("next".equals(action)){
    qid++;
}
else if("prev".equals(action)){
    if(qid > 1) qid--;
}
else if("submit".equals(action)){
    session.setAttribute("answers", answers);
    response.sendRedirect("result.jsp");
    return;
}

/* SAVE SESSION */
session.setAttribute("qid", qid);
session.setAttribute("answers", answers);

/* ===== FETCH QUESTION ===== */
Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM questions WHERE subject=? LIMIT ?,1"
);

ps.setString(1, (String)session.getAttribute("subject"));
ps.setInt(2, qid-1);

ResultSet rs = ps.executeQuery();
%>

<!-- HEADER -->
<div class="exam-header">
    <div>Online Exam</div>
    <div> Time Left: <span id="timer"></span></div>
</div>

<div class="exam-container">

    <!-- QUESTION PANEL -->
    <div class="question-panel">

        <h3>Question <%=qid%></h3>

        <form method="post">

        <%
        if(rs.next()){
            String sel = answers.get(qid);
        %>

        <p class="question-text"><%=rs.getString("question")%></p>

        <label class="option">
            <input type="radio" name="ans" value="<%=rs.getString("option1")%>"
            <%=sel!=null && sel.equals(rs.getString("option1")) ? "checked" : ""%>>
            <%=rs.getString("option1")%>
        </label>

        <label class="option">
            <input type="radio" name="ans" value="<%=rs.getString("option2")%>"
            <%=sel!=null && sel.equals(rs.getString("option2")) ? "checked" : ""%>>
            <%=rs.getString("option2")%>
        </label>

        <label class="option">
            <input type="radio" name="ans" value="<%=rs.getString("option3")%>"
            <%=sel!=null && sel.equals(rs.getString("option3")) ? "checked" : ""%>>
            <%=rs.getString("option3")%>
        </label>

        <label class="option">
            <input type="radio" name="ans" value="<%=rs.getString("option4")%>"
            <%=sel!=null && sel.equals(rs.getString("option4")) ? "checked" : ""%>>
            <%=rs.getString("option4")%>
        </label>

        <!-- BUTTONS -->
        <div class="exam-buttons">
            <button name="action" value="prev">Previous</button>
            <button name="action" value="next">Next</button>
            <button name="action" value="submit" class="submit-btn"
            onclick="return confirm('Submit exam?')">Submit</button>
        </div>

        <%
        } else {
            response.sendRedirect("result.jsp");
        }
        %>

        </form>
    </div>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h4>Questions</h4>

        <%
        int totalQuestions = 5; // adjust if needed

        for(int i=1; i<=totalQuestions; i++){
        %>
            <a href="exam.jsp?qid=<%=i%>">
                <button class="q-btn <%= (i==qid ? "active" : "") %>">
                    <%=i%>
                </button>
            </a>
        <%
        }
        %>
    </div>

</div>

<script src="js/timer.js"></script>

</body>
