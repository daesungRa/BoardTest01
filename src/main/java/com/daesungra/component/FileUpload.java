package com.daesungra.component;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.daesungra.domain.MemberVo;

/*
 * 파일 업로드를 위한 멀티파트 객체 활용
 * 반환값은 각 요청 형식에 맞는 vo 객체이다
 */
@Repository
public class FileUpload {
	private MemberVo mvo = null;

	private String oriFileName = "";
	private String sysFileName = "";
	private String saveDir = "D://git/DeskTop-portfolio-daesungra/src/main/webapp/resources/imgs/memberImg/";
	
	// 전달받은 요청 객체의 파일을 multipart 인스턴스를 활용해 서버에 저장한 후 (sysFileName)
	// 오리지널 파일명, 실제 저장 파일명 구분해 vo 객체 생성 후 반환
	public MemberVo getMemberVo (HttpServletRequest request) {		
		// 지정된 경로의 디렉토리가 없다면 새로 생성
		File file = new File(saveDir);
		if (!file.isDirectory()) {
			file.mkdirs();
		}
		
		try {
			// enctype='multipart/form-data' 방식으로 넘어온 요청정보를 다루기 위해 
			// 스프링 컨테이너에 포함된 MultipartHttpServletRequest 객체로 변환하여 사용한다
			// 이 클래스는 HttpServletRequest, MultipartRequest, ServletRequest 의 세 인터페이스를 구현한 자손 인터페이스이므로
			// 같은 계열 request 객체를 캐스팅해 활용 가능하다
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
			Iterator<String> ite = multi.getFileNames();
			while (ite.hasNext()) {
				String tagName = ite.next();
				MultipartFile mFile = multi.getFile(tagName);
				
				// 전달받은 파일 확인
				System.out.println("file form name : " + mFile.getName());
				System.out.println("ori file name : " + mFile.getOriginalFilename());
				System.out.println("file size : " + mFile.getSize());
				System.out.println("is existing? : " + mFile.isEmpty());
				
				// 오리지널 파일명, 인코딩 처리
				oriFileName = new String(mFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
				// 실제 저장 파일명은 오리지널 파일명으로 지정했다가, 추후 지정 경로에 동일 파일명이 존재하면 수정한다
				sysFileName = oriFileName;
				
				// 지정 경로에 파일 저장하기
				// 저장할 파일이 존재한다면 수행
				if (sysFileName != null && !sysFileName.equals("")) {
					// 지정 경로에 동일 파일명이 이미 존재한다면 실제 저장 파일명 변경 (시스템 시각을 더함)
					if (new File(saveDir + sysFileName).exists()) {
						String preName = sysFileName.substring(0, sysFileName.lastIndexOf("."));
						String postName = sysFileName.substring(sysFileName.lastIndexOf("."), sysFileName.length());
						System.out.println("preName: " + preName + ", postName: " + postName);
						sysFileName = preName + "_" + System.currentTimeMillis() + postName; // 같은 파일명이 존재하므로 저장파일명 변경
					}
					
					// 컨테이너에 임시 파일로 저장되어 있으므로, 실제 지정 경로로 transfer 해야 한다
					// InputStream 사용해도 됨
					mFile.transferTo(new File(saveDir + sysFileName)); // 최종 조립된 이름으로 지정 경로로 전송(저장)
					System.out.println("================================");
					System.out.println("[result] ori : " + oriFileName);
					System.out.println("[result] sys : " + sysFileName);
					
					// 파일 저장까지 완료했다면, 반환할 vo 객체를 생성한다
					// 여기에 ori, sys 파일을 구분해서 세팅한다
					this.mvo = new MemberVo();
					
					// id, pwd, name, email, phone 은 필수입력사항
					mvo.setUserId(multi.getParameter("userId"));
					mvo.setUserPwd(multi.getParameter("userPwd"));
					mvo.setUserName(multi.getParameter("userName"));
					mvo.setEmail(multi.getParameter("email"));
					mvo.setPhone(multi.getParameter("phone"));
					// 넘어온 postal 이 존재한다면
					if (!multi.getParameter("postal").equals("")) {
						mvo.setPostal(multi.getParameter("postal"));
					}
					// 추가주소가 있다면,
					if (multi.getParameter("address") != null && !multi.getParameter("address").equals("") && !multi.getParameter("addressAdd").equals("")) {
						mvo.setAddress(multi.getParameter("address"));
						mvo.setAddressAdd(multi.getParameter("addressAdd"));
					} else if (multi.getParameter("address") != null && !multi.getParameter("address").equals("")) {
						mvo.setAddress(multi.getParameter("address"));
						mvo.setAddressAdd("");
					} else {
						mvo.setAddress("");
						mvo.setAddressAdd("");
					}
					mvo.setPhoto(saveDir + sysFileName); // 실제 저장 파일명. 나중에 쉽게 가져오기 위해 전체 경로 입력
					mvo.setPhotoOri(oriFileName); // 사용자에게 보여질 오리지널 파일명
				} else {
					// 저장에 성공한 파일이 존재하지 않거나
					// 애초에 요청받은 파일 정보가 없는 경우 파일을 제외한 정보만 저장됨
					this.mvo = new MemberVo();
					
					mvo.setUserId(multi.getParameter("userId"));
					mvo.setUserPwd(multi.getParameter("userPwd"));
					mvo.setUserName(multi.getParameter("userName"));
					mvo.setEmail(multi.getParameter("email"));
					mvo.setPhone(multi.getParameter("phone"));
					// 넘어온 postal 이 존재한다면
					if (!multi.getParameter("postal").equals("")) {
						mvo.setPostal(multi.getParameter("postal"));
					}
					// 추가주소가 있다면,
					if (multi.getParameter("address") != null && !multi.getParameter("address").equals("") && !multi.getParameter("addressAdd").equals("")) {
						mvo.setAddress(multi.getParameter("address"));
						mvo.setAddressAdd(multi.getParameter("addressAdd"));
					} else if (multi.getParameter("address") != null && !multi.getParameter("address").equals("")) {
						mvo.setAddress(multi.getParameter("address"));
						mvo.setAddressAdd("");
					} else {
						mvo.setAddress("");
						mvo.setAddressAdd("");
					}
					mvo.setPhoto("");
					mvo.setPhotoOri("");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return this.mvo;
	}
}
