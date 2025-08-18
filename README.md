

# Flutter Mobile Development Internship Assessment

This assessment evaluates your knowledge and skills in Flutter mobile development after a 6-month internship. It includes theoretical questions, coding tasks, problem-solving scenarios, and evaluation components to assess your understanding. Please provide clear, concise answers or code solutions, and be prepared to explain your work.

## Section 1: Theoretical Questions

1. **Dart Basics**  
   Explain the difference between `final` and `const` in Dart. Provide an example of when you would use each in a Flutter application.  
   *Evaluation*: In a follow-up discussion, describe a situation from your internship where you chose one over the other and why.

2. **Widget Types**  
   Describe the difference between `StatelessWidget` and `StatefulWidget`. Provide a scenario where you would choose one over the other in a Flutter app.  
   *Evaluation*: Explain how you decided which widget type to use in a specific feature you worked on during your internship.

3. **State Management**  
   What is state management in Flutter? Name two state management approaches you have used or learned about during your internship, and briefly explain how one of them works.  
   *Evaluation*: Be prepared to discuss trade-offs of the state management approach you explained, based on your experience.

4. **Navigation**  
   Explain how to navigate between two screens in a Flutter app using `Navigator`. Include an example of passing data from one screen to another.  
   *Evaluation*: Provide a brief written reflection on any navigation-related challenges you faced during your internship and how you resolved them.

5. **Async Programming**  
   What is the purpose of the `async` and `await` keywords in Dart? Provide a simple example of fetching data from an API using `http` package in a Flutter app.  
   *Evaluation*: In a follow-up discussion, explain how you handled an async-related bug (real or hypothetical) in your code.

## Section 2: Coding Tasks

6. **Build a Simple UI**  
   Create a Flutter screen that displays a list of 10 items using `ListView.builder`. Each item should show a title and a subtitle, and tapping an item should display a `SnackBar` with the item's title.  
   Requirements:  
   - Use a `StatelessWidget` or `StatefulWidget` as appropriate.  
   - Style the list items with basic padding and text styling.  
   - Ensure the `SnackBar` appears when an item is tapped.  
   *Evaluation*: Submit a written explanation (100-150 words) of your code, describing why you structured it the way you did and how it meets the requirements.

7. **Form Validation**  
   Write a Flutter form with two `TextFormField` widgets: one for email and one for password. Implement validation to ensure:  
   - The email field is not empty and contains a valid email format (e.g., contains `@` and `.`).  
   - The password is at least 6 characters long.  
   - Display an error message below each field if validation fails.  
   - Include a submit button that shows a `SnackBar` with "Form Submitted" when the form is valid.  
   *Evaluation*: Submit a written explanation (100-150 words) of how your validation logic works and why you chose your approach. Be prepared to modify the validation rules in a live coding session (e.g., change password length to 8 characters).

8. **API Integration**  
   Write a Flutter function to fetch a list of users from the JSONPlaceholder API (`https://jsonplaceholder.typicode.com/users`). Display the users' names and emails in a `ListView`. Handle loading and error states appropriately.  
   Requirements:  
   - Use the `http` package for API calls.  
   - Show a loading indicator while fetching data.  
   - Display an error message if the API call fails.  
   *Evaluation*: Submit a written explanation (100-150 words) of how you handled loading and error states, and why your approach is effective. Be prepared to demonstrate the code in a live session and explain the HTTP response handling.

## Section 3: Problem-Solving Scenarios

9. **Debugging**  
   You built a Flutter app, but the UI does not update when you change a variable's value in a `StatefulWidget`. Explain possible reasons for this issue and how you would fix it.  
   *Evaluation*: In a live session, you will be given a small Flutter code snippet with a similar bug. Identify and fix the issue while explaining your steps.

10. **Performance Optimization**  
    Your Flutter app has a `ListView` with 1000 items, and scrolling feels laggy. Suggest two techniques to improve the performance of the `ListView` and explain how they work.  
    *Evaluation*: In a follow-up discussion, describe how you would test whether your optimization techniques improved performance in a real app.

## Section 4: Live Evaluation

11. **Live Debugging Task**  
    During the assessment review, you will be provided with a Flutter app containing 2-3 intentional bugs (e.g., navigation error, state not updating, or incorrect widget rendering). You will:  
    - Identify the bugs.  
    - Explain why they occur.  
    - Fix them in a live coding environment while verbalizing your thought process.  
    *Purpose*: This ensures you can apply debugging skills independently and understand the code you write.

12. **Follow-Up Discussion**  
    After submitting your answers and code, participate in a 15-20 minute discussion with your supervisor. Be prepared to:  
    - Explain the logic behind your code for the coding tasks.  
    - Answer follow-up questions about your theoretical responses.  
    - Reflect on how your internship experience influenced your solutions.  
    *Purpose*: This verifies that you understand the concepts and can articulate your decisions without relying on external tools.

## Submission Instructions
- For theoretical questions, provide clear and concise answers in a document, including the reflection components for evaluation.
- For coding tasks, submit working Flutter code snippets (Dart files) that can be tested, along with the required written explanations (100-150 words per task).
- For problem-solving scenarios, explain your approach in a few sentences, focusing on practical solutions.
- Ensure your code follows Dart and Flutter best practices (e.g., proper widget structure, error handling, and clean code).
- Be prepared for the live debugging task and follow-up discussion, which will be scheduled after submission.
