package controller;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import model.Exam;

import model.Question;
import model.Subject;
import repository.BaseRepository;
import service.ExamService;
import service.ExamViewService;

import service.SubjectService;
import service.impl.ExamServiceImpl;
import service.impl.ExamViewServiceImpl;

import service.impl.SubjectServiceImpl;
import util.HandleString;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;




@WebServlet(name = "ExamServlet", urlPatterns = "/admin/exams")
public class ExamServlet extends HttpServlet {
    private ExamService examService = new ExamServiceImpl();
    private SubjectService subjectService = new SubjectServiceImpl();
    private HandleString handleString = new HandleString();
    private final int entryDisplay = BaseRepository.entryDisplay;
    private static final String FONT = "fonts/arial-unicode-ms.ttf";
     ExamViewService examViewService = new ExamViewServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showFormCreate(request, response);
//                response.sendRedirect("admin/");
                break;
            }
            case "edit": {
                editExam(request, response);
                break;
            }
//            case "delete": {
//                deleteExam(request, response);
//                break;
//            }
            case "search": {
                //   searchQuestion(request, response);
            }
            default:
                examList(request, response);
                break;
        }

    }
    private void deleteExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("idExa"));
        System.out.println(exam_id);
        examService.deleteExam(exam_id);
        examList(request, response);

    }
    private void editExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("id"));
        Exam exam = examService.selectExam(exam_id);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("exam", exam);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("/admin/exam-list.jsp").forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Subject> subjects = subjectService.selectAllSubject();
        request.setAttribute("listSubject", subjects);
        request.getRequestDispatcher("/admin/exam-list.jsp").forward(request, response);
    }

    private void examList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index = request.getParameter("index");
        if(index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        int indexExamStart = ((indexPage - 1)*entryDisplay + 1);

        List<Exam> listExam = examService.paginateExam(indexPage);
        List<Subject> listSubject = subjectService.selectAllSubject();
        request.setAttribute("listExam", listExam);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("currentPage", indexPage);
        request.setAttribute("indexExamStart", indexExamStart);
        request.setAttribute("entryDisplay", entryDisplay);
        pagingExam(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/exam-list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createExam(request, response);
                break;
            }
            case "print": {
                printExam(request, response);
                break;
            }
            case "edit": {
                updateExam(request, response);
                break;
            }
            case "delete": {
                  deleteExam(request, response);
                break;
            }
        }

    }

    private void printExam(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String examIds = request.getParameter("idExa");
        int examId = Integer.parseInt(examIds);
        List<Question> questionList = examViewService.loadExamQuestion(examId);
        String exams = examService.selectExam(examId).getExamName();
        String exam1 = examService.selectExam(examId).getAllowedTime();
        String subject = examService.selectExam(examId).getSubject().getSubject_name();
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=example.pdf");

        PdfDocument pdfDoc = new PdfDocument(new PdfWriter(response.getOutputStream()));
        Document document = new Document(pdfDoc, PageSize.A4);
        PdfFont font = PdfFontFactory.createFont(FONT, PdfEncodings.IDENTITY_H, true);

        String name1 = request.getParameter("name1");
        try {
//            Paragraph paragraph = new Paragraph(name1).setFont(font);
//            document.add(paragraph);
//            Paragraph paragraph123 = new Paragraph("Subject: " + String.valueOf(subject)).setFont(font);
//            document.add(paragraph123);
            Paragraph paragraphab = new Paragraph("Welcome to the online quiz website");
            document.add(paragraphab);
            Paragraph paragraph12 = new Paragraph(String.valueOf(exams)).setFont(font);
            document.add(paragraph12);
            Paragraph paragrapha = new Paragraph("Time: " + String.valueOf(exam1) + " minutes") .setFont(font);
            document.add(paragrapha);

//
//            Paragraph paragraph1 = new Paragraph("Tieu de: " + thoigian).setFont(font);
//            document.add(paragraph1);
            int count = 1;
            for (Question question : questionList) {
                Paragraph paragraph1 = new Paragraph("Question " + count + ":  " + question.getDescription()).setFont(font);
                document.add(paragraph1);

                Paragraph paragraph2 = new Paragraph("A: " + question.getAnswer1()).setFont(font);
                document.add(paragraph2);

                Paragraph paragraph3 = new Paragraph("B: " + question.getAnswer2()).setFont(font);
                document.add(paragraph3);

                Paragraph paragraph4 = new Paragraph(" C: " + question.getAnswer3()).setFont(font);
                document.add(paragraph4);

                Paragraph paragraph5 = new Paragraph("D: " + question.getAnswer4()).setFont(font);
                document.add(paragraph5);
                count++;
            }

        } finally {
            document.close();
            pdfDoc.close();
        }

    }

    private void updateExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int exam_id = Integer.parseInt(request.getParameter("exam_id"));
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        String allowed_time = request.getParameter("allowed_time");
        String exam_name = handleString.handleFont(request.getParameter("exam_name"));
//        String subject_name = request.getParameter("subject_name");
        Exam exam = new Exam(exam_id, new Subject(subject_id), allowed_time, exam_name );
        examService.updateExam(exam);
        examList(request, response);
    }

    private void createExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //  int exam_id= Integer.parseInt(request.getParameter("exam_id"));
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        System.out.println(subject_id);
        String allowed_time = request.getParameter("allowed_time");
        String exam_name = handleString.handleFont(request.getParameter("exam_name"));
        System.out.println(exam_name);
        Exam exam = new Exam(1,new Subject(subject_id),allowed_time, exam_name);
        System.out.println(exam);
        examService.insertExam(exam);
        response.sendRedirect("/admin/exams");

    }

    private void pagingExam(HttpServletRequest request) throws ServletException, IOException{
        int totalExam = examService.getTotalExam();
        int maxPages = totalExam/entryDisplay;
        if (totalExam%entryDisplay != 0){
            maxPages++;
        }
        request.setAttribute("totalExam", totalExam);
        request.setAttribute("maxPages", maxPages);
    }
}
