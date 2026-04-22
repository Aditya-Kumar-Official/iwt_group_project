<%
String subject = request.getParameter("subject");

session.setAttribute("subject", subject);
session.setAttribute("qid", 1);
session.setAttribute("answers", null);
%>

<!DOCTYPE html>
<html>
<head>
<title>Instructions</title>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
</head>

<body class="instructions-page">

<div class="instructions-box">

    <h2>Exam Instructions</h2>

    <ul>
        <li>Total Questions: 5</li>
        <li>Each Question carries 1 mark</li>
        <li>No negative marking</li>
        <li>Total Duration: 5 minutes</li>
        <li>All questions are MCQ type</li>
        <li>Do not refresh the page during exam</li>
        <li>Exam will auto-submit when time ends</li>
    </ul>

    <div class="checkbox">
        <input type="checkbox" id="agree" onclick="toggleBtn()">
        <label for="agree">I agree to all the terms and conditions</label>
    </div>

    <button class="start-btn" id="startBtn" disabled onclick="startExam()">
        Start Exam
    </button>

</div>

<script>
function toggleBtn(){
    let check = document.getElementById("agree");
    let btn = document.getElementById("startBtn");

    btn.disabled = !check.checked;
}

function startExam(){
    localStorage.removeItem("endTime"); // reset timer
    window.location.href = "exam.jsp";
}
</script>

</body>
</html>