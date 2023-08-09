
function infoValidate(){
    const memberNickname = document.getElementById("memberNickname");
    const memberTel = document.getElementById("memberTel");

    
    
    
    const regExp1 = /^[a-zA-Z0-9가-힣]{2,10}$/; // 닉네임 정규식
    const regExp2 = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호 정규식
    
    // 010 011 016 017 019
    // 02 031 032 041 042 051 052
    // 070

    // 닉네임 유효성 검사
    if(memberNickname.value.trim().length==0){ // 미작성 시
        /* alert("닉네임을 입력해주세요.");
        memberNickname.focus();
        memberNickname.value="";
        return false; */

        return printAlert(memberNickname, "닉네임을 입력해주세요.");
    }
    
    if(!regExp1.test(memberNickname.value)){ // 유효하지 않은 경우
        /* alert("닉네임은 영어/숫자/한글 2~10 글자 사이로 작성해주세요");
        memberNickname.focus();
        memberNickname.value="";
        return false; */
        return printAlert(memberNickname, "닉네임은 영어/숫자/한글 2~10 글자 사이로 작성해주세요.");
    }
    
    // 전화번호 유효성 검사
    if(memberTel.value.trim().length==0){ // 미작성 시
        /* alert("전화번호를 입력해주세요(-제외)");
        memberTel.focus();
        memberTel.value="";
        return false; */
        return printAlert(memberTel, "전화번호를 입력해주세요(-제외)");
    }


    if(!regExp2.test(memberTel.value)){
        /* alert("전화번호 형식이 올바르지 않습니다.");
        memberTel.focus();
        memberTel.value="";
        return false; */

        return printAlert(memberTel, "전화번호 형식이 올바르지 않습니다.");
    }



    return true; // true 반환해서 form 제츨 수행
}

// 경고 출력 + 포커스 + false + 비우기
function printAlert(el, message){ // 매개변수 el은 요소
    alert(message);
    el.focus();
    el.value="";
    return false;
}

// 비밀번호 변경 제출 시 유효성 검사
function changePwValidate(){

    // 비밀번호 변경 관련 input 요소 얻어오기
    const currentPw = document.getElementById("currentPw");
    const newPw = document.getElementsByName("newPw")[0];
    const newPwConfirm = document.getElementsByName("newPwConfirm")[0];

    // 비밀번호 정규식
    /* const regExp = /^[a-zA-Z0-9\!\@\#\-\_]{6,30}$/; */

    const regExp = /^[\w!@#_-]{6,30}/;

    // 형재 비밀번호 미작성
    if(currentPw.value.trim().length == 0){
        return printAlert(currentPw, "현재 비밀번호를 입력해주세요");
    }
    
    // 새 비밀번호 미작성
    if(newPw.value.trim().length == 0){
        newPwConfirm.value="";
        return printAlert(newPw, "새 비밀번호를 입력해주세요");
    }

    // 유효하지 않은 경우
    if(!regExp.test(newPw.value)){
        newPwConfirm.value="";
        return printAlert(newPw,"영어, 숫자, 특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.")
    }

    // 새 비밀번호 미작성
    if(newPwConfirm.value.trim().length == 0){
        return printAlert(newPwConfirm, "새 비밀번호 확인을 입력해주세요");
    }
    
    // 새 비밀번호 != 새 비밀번호 확인
    if(newPw.value != newPwConfirm.value){
        newPwConfirm.value="";
        return printAlert(newPw,"새 비밀번호가 일치하지 않습니다.")
        
    }

    return true; // 위 조건을 모두 수행하지 않은 경우 true 반환


}

// 회원탈퇴 유효성 검사
function secessionValidate(){
    const memberPw = document.getElementsByName("memberPw")[0];
    const agree = document.getElementById("agree");

    if(memberPw.value.trim().length==0){
        return printAlert(memberPw, "비밀번호를 입력해주세요");
    }

    if(!agree.checked){
        alert("약관 동의 후 탈퇴 버튼을 클릭해주세요");
        return false;
    }

    // 정말 탈퇴할지 확인
    // - window.confirm("내용") : 대화상자에 확인/취소 생성
    //   확인 클릭 시 true/ 취소 클릭 시 false

    if(!confirm("정말 탈퇴하시겠습니까?")){ // 취소를 누른 경우
        return false;
    } else{
    }
    return true;


    /* if(memberPw.value.trim().length !=0 && agree.checked){
        if(confirm("정말 탈퇴하시겠습니까?")){
            return true;
        } else{
            return false;
        }
    } */

}

// 회원 프로필 이미지 변경(미리보기)
const inputImage = document.getElementById("input-image");
if(inputImage != null){ // inputImage 요소가 화면에 존재할 때

    // input type ="file"요소는 파일이 선택될 때 change 이벤트가 발생한다.
    inputImage.addEventListener("change", function(){
        
        // this : 이벤트가 발생한 요소(input type = "file")
        
        // files : input type = "file"만 사용 가능한 속성으로
        //         선택된 파일 목록(배열)을 반환
        //console.log(this.files);
        //console.log(this.files[0]);

        if(this.files[0] != undefined) { // 파일이 선택되었을 때

            const reader = new FileReader();
            // 자바스크립트에서의 FileReader
            // - 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 사용하는 객체

            reader.readAsDataURL(this.files[0]);
            // FileReader.readAsDataURL(파일)
            // - 지정된 파일의 내용을 읽기 시작함
            // - 읽어오는 게 완료되면 result 속성 data: 에
            //   읽어온 파일의 위치를 나타내는 URL이 포함된다.
            //  -> 해당 URL을 이용해서 브라우저에 이미지를 볼 수 있다.

            // FileReader.onload = function(){}
            // - FileReader가 파일을 다 읽어온 경우 함수를 수행
            reader.onload = function(e){ // 고전 이벤트 모델

                // e : 이벤트 발생 객체
                // e.target : 이벤트가 발생한 요소(객체) -> FileReader
                // e.target.result : FileReader가 읽어온 파일의 URL

                // 프로필 이미지의 src 속성의 값을 FileReader가 읽어온 파일의 URL로 변경
                const profileImage = document.getElementById("profile-image");

                profileImage.setAttribute("src", e.target.result);
                // -> setAttribute() 호출 시 중복되는 속성이 존재하면 덮어쓰기

                document.getElementById("delete").value == 0;
                // 새로운 이미지가 선택되었기 때문에 1 -> 0 (안 눌러짐 상태)로 변경
            }
        }
    })

}

function profileValidate(){

    const inputImage = document.getElementById("input-image");

    const del = document.getElementById("delete"); // hidden 타입

    if(inputImage.value == "" && del.value==0){ 
        // 빈문자열 == 파일 선택 X / del 값이 0 == x를 누르지도 않았다.
        // -> 아무것도 안 하고 변경버튼을 클릭한 경우

        alert("이미지를 선택한 후 변경 버튼을 클릭해주세요.");
        return false;
    }
    
    return true;

}

// 프로필 이미지 옆 X 버튼 클릭 시 
document.getElementById("delete-image").addEventListener("click", function(){

    // 0 : 안 눌러짐
    // 1 : 눌러짐
    const del = document.getElementById("delete");

    if(del.value==0){ // 눌러지지 않은 경우라면
        
        // 1) 프로필 이미지를 기본 이미지로 변경
        document.getElementById("profile-image").setAttribute("src", contextPath + "/resources/images/user.png");
    
        // 2) input type='file'에 저장된 값(value)에 "" 대입
        document.getElementById("input-image").value="";

        del.value = 1; // 눌러진 걸로 인식

    }



})