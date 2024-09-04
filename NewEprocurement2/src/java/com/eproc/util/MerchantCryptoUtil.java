package com.lincpay.merchant.util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Service;

@Service
public class MerchantCryptoUtil {

//	private static final Logger LOGGER = LoggerFactory.getLogger(MerchantCryptoUtil.class);

	public static void main(String[] args) {
		String encryptionKey = "3h7g70a3d6q7g1r3d7a5s2k02hgy1djb";
		String plainText = "{\"mid\":\"SLCOS00007SATN\",\"enckey\":\"qkj8g16h8us79we0yo9f58g7sbel1dh9\",\"orderNo\":\"77fae0ef2f3c14e11e63\",\"amount\":\"100\",\"currency\":\"INR\",\"txnReqType\":\"slupi\",\"emailId\":\"Player0857406555@gmail.com\",\"mobileNo\":\"7611111111\",\"address\":\"jaipur\"}";
		try {
			//String encryptData = new MerchantCryptoUtil().encryptMData(plainText, encryptionKey);
			String encryptData = "L5QMPWLaE0iuEc4c8/IXZxJOXNopDcCdUmdgPANYESlLq4qpibWM9j9KIi1WnvoeOqoBAFe3TI1zxLTmZ8IyWhrCZKF4cofFq4JX9fiXfUMteRNNAiRmC238q63g1A4Q/6j2Z/ZJjIi+DOdr5uH+uhS2RbJzfdrkorNG1MBjXja6ARtsEFBrCZCnLyXSAyYlgbYWGG7GUpw2cIUD2iNX4F2GQNeKMc/VPmVlemvR+wCVU9NgwsdvM5NQIy9Cl+fIUEXaAkfFtcYcAqXWGHbWpRje3R7nIbHSl8VWU7whY6/bY1x+FNoiD9lvWyZVqsbn4VDMiDYuS5aqUdSv7L2IvkzenoRFppWhv3Z9Y33OaaQ2oVApQ8EDEgYYjuuf7KLxE9z3VRd7vUbqkMWDP9UCbSpebkXJPRkggUW+s1i5kLI=";
//			LOGGER.info("encrypted String: " + encryptData);
			String decryptedString = new MerchantCryptoUtil().decryptMData(encryptData, encryptionKey);
//			LOGGER.info("Decrypted String: " + decryptedString);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String encryptMData(String plaintext, String encryptKey) {
		try {
			SecretKeySpec secretKeySpec = new SecretKeySpec(encryptKey.getBytes("UTF-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);

			byte[] ivBytes = cipher.getParameters().getParameterSpec(IvParameterSpec.class).getIV();
			byte[] encryptedData = cipher.doFinal(plaintext.getBytes("UTF-8"));

			byte[] combinedBytes = new byte[ivBytes.length + encryptedData.length];
			System.arraycopy(ivBytes, 0, combinedBytes, 0, ivBytes.length);
			System.arraycopy(encryptedData, 0, combinedBytes, ivBytes.length, encryptedData.length);
			return Base64.getEncoder().encodeToString(combinedBytes);
		} catch (Exception e) {
//			LOGGER.error("Exception in encrypt() : encryptMData- " + encryptKey + " : Message- " + e.getMessage());
		}
		return null;
	}

	public String decryptMData(String encryptedString, String encryptKey) {
		try {
			byte[] encryptedData = Base64.getDecoder().decode(encryptedString);
			byte[] ivBytes = new byte[16];
			System.arraycopy(encryptedData, 0, ivBytes, 0, 16);

			byte[] encryptedBytes = new byte[encryptedData.length - 16];
			System.arraycopy(encryptedData, 16, encryptedBytes, 0, encryptedData.length - 16);
			SecretKeySpec secretKeySpec = new SecretKeySpec(encryptKey.getBytes("UTF-8"), "AES");
			IvParameterSpec ivParameterSpec = new IvParameterSpec(ivBytes);

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
			byte[] decryptedData = cipher.doFinal(encryptedBytes);
			return new String(decryptedData);
		} catch (Exception e) {
//			LOGGER.error("Exception in decryptMData() : encryptKey- " + encryptKey + " : Message- " + e.getMessage());
		}
		return null;
	}
}