import com.google.gson.Gson;
import com.google.gson.JsonParser;
import java.awt.*;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.ObjectInputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyStore;
import java.security.PublicKey;
import java.security.cert.X509Certificate;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.jnlp.BasicService;
import javax.jnlp.PersistenceService;
import javax.jnlp.ServiceManager;
import javax.jnlp.UnavailableServiceException;
import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import sun.misc.BASE64Encoder;

import com.google.gson.JsonElement;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfSignatureAppearance;
import com.lowagie.text.pdf.PdfStamper;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.URLConnection;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.cert.Certificate;
import java.util.*;

import java.net.URISyntaxException;
import java.io.*;
import java.net.*;
import java.security.*;
import java.util.concurrent.CancellationException;
import javax.naming.ldap.LdapName;
import javax.naming.ldap.Rdn;
import javax.security.auth.callback.CallbackHandler;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import org.bouncycastle.asn1.x500.RDN;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x500.style.IETFUtils;
import org.bouncycastle.cert.jcajce.JcaX509CertificateHolder;

public class MultiTenderActionSign {

    static JTable jTable1;
    static String IssuedTo = null;
    static String IssuedBy = null;
    static String SerialNo = null;
    static String expiryDate = null;
    static BasicService basicService = null;
    static JTextField directoryfield;
    private static final long serialVersionUID = 5056882618968364572L;
    private URL codebase = null;
    static boolean isFileChoosed = false;
    static boolean isCertificateSelected = false;
    public static String s = null;
    static KeyStore ks = null;
    static String idJson;
    static int tender_id;
    static int tender_no;
    static String dscSerialNo;
    static String filePath;
    static String browser;
    private String departmentUserId;
    private String randomNo;
    static MultiTenderActionSign testJnlp;
    static String actionMessage;

    // new entities added
    static Properties prop = new Properties();
    static Properties browserProp = new Properties();
    static String windowsBrowserFileName = "windowsBroser.properties";
    static String linuxBrowserFileName = "linuxBrowser.properties";
    static String macBrowserFileName = "macBrowser.properties";
    static String windowsDriverLocationFileName = "windowsDriverLocationPropertyFile.properties";
    static String linuxDriverLocationFileName = "linuxDriverLocationPropertyFile.properties";
    static String macDriverLocationFileName = "macDriverLocationPropertyFile.properties";
    static String selectedTokenValue;
    static TokenFrame tokenFrame;
    static Provider pkcs11Provider = null;
    static String pkcs11Config = null;
    static X509Certificate c = null;
    private static boolean keyUsage[] = new boolean[15];
    private static String commonName = "";
    private static String departmentAllowedDSCType = "2";
    private static String deptClass2 = "";
    private static String deptClass3 = "";
    private static String deptUserName = "";
    private static int dt = 0;
    private static final int SIGNING = 0;
    private static final int ENCRYPTION = 2;

    private String contractorId;
    private static String dscType = "Signing";

    public static void main(String args[]) {
        System.out.println("Now Main method started");

        // check os name and version and java
        final String osName = System.getProperty("os.name");
        System.out.println("os name is: +" + osName);

        // read and parse data
        testJnlp = new MultiTenderActionSign();
        testJnlp.readData(args);

        // set codebase globally
        testJnlp.setCodeBase();

        // check jnlp status
        final String status = testJnlp.accessJnlpStatus();

        // check operating system for different versions
        if (osName != null && osName.contains("Windows")) { // check for any versions of windows

            directoryfield = new JTextField();

            JDialog.setDefaultLookAndFeelDecorated(true);

            // create a jframe 
            final JFrame frame = new JFrame("Verify your Dsc");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setLayout(new BorderLayout());

            // create different jpanel for different section
            JPanel btnPnl = new JPanel(new BorderLayout());
            JPanel topBtnPnl = new JPanel(new FlowLayout(FlowLayout.LEADING));
            JPanel bottombtnPnl = new JPanel(new FlowLayout(FlowLayout.CENTER));

            // create label for file name and buttons
            final JLabel fileLabel = new JLabel();
            final JButton buttonCance = new JButton("Cancel");
            final JButton buttonSaveDsc = new JButton("Proceed");

            bottombtnPnl.add(buttonSaveDsc);
            bottombtnPnl.add(buttonCance);
            buttonSaveDsc.setEnabled(false);

            // add buttons and label to panel
            bottombtnPnl.add(fileLabel);
            btnPnl.add(topBtnPnl, BorderLayout.NORTH);
            btnPnl.add(bottombtnPnl, BorderLayout.CENTER);
            jTable1 = new javax.swing.JTable(20, 4);

            if (status != null && "active".equals(status)) {
                JOptionPane.showMessageDialog(null, "You can not proceed again from here. Please go to website link to proceed again!!");
                return;
            }

            // read keystore and create jtable with all certificate
            try {
                ks = KeyStore.getInstance("Windows-MY");
                ks.load(null, null);
                StringBuffer sb = new StringBuffer();
                Enumeration en = ks.aliases();
                int i = 0;
                String alias;

                DefaultTableModel defaultTableModel = new DefaultTableModel() {
                    public boolean isCellEditable(int row, int column) {
                        return false;
                    }
                };
                // String header[] = new String[]{"Issued To", "Issued By", "Expiration Date", "Serial No"};
                String header[] = new String[]{"Issued To", "Issued By", "Expiration Date", "Common Name(CN)", "Serial No", "Type"};
                defaultTableModel.setColumnIdentifiers(header);
                jTable1.setModel(defaultTableModel);

                while (en.hasMoreElements()) {
                    int j = 0;
                    alias = en.nextElement().toString();
//                    X509Certificate c = (X509Certificate) ks.getCertificate(alias);
//                    defaultTableModel.addRow(new Object[]{alias, c.getIssuerX500Principal().getName(), c.getNotAfter(),
//                        c.getSerialNumber(),dscType});
                    c = (X509Certificate) ks.getCertificate(alias);
                    System.out.println("Dsc Holder : " + alias);
                    if (c != null) {
                         commonName = getCommonName(c.getSubjectDN());
                        System.out.println(status);
//                        if (isClass2(c)) {
                            defaultTableModel.addRow(new Object[]{alias, c.getIssuerX500Principal().getName(), c.getNotAfter(), commonName, c.getSerialNumber(), dscType});
//                        }
                    }
                    i++;
                }

                /*
                 * for display the selected DSC Info
                 */
                ListSelectionModel cellSelectionModel = jTable1.getSelectionModel();
                cellSelectionModel.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

                cellSelectionModel.addListSelectionListener(new ListSelectionListener() {

                    public void valueChanged(ListSelectionEvent e) {

                        int row = jTable1.getSelectedRow();
                        IssuedTo = jTable1.getValueAt(row, 0).toString();
                        IssuedBy = jTable1.getValueAt(row, 1).toString();
                        expiryDate = jTable1.getValueAt(row, 2).toString();
                        SerialNo = jTable1.getValueAt(row, 4).toString();

                        int selection = JOptionPane.showConfirmDialog(
                                null, "Do you really want to Aprroved this tender !" + "\n" + IssuedTo + "\n" + IssuedBy + "\n" + expiryDate + "\n" + SerialNo, "Lotus Procurement : ", JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE);
                        System.out.println("I be written"
                                + " after you close, the JOptionPane");
                        if (selection == JOptionPane.OK_OPTION) {
                            buttonSaveDsc.setEnabled(true);
                            System.out.println("Selected Option is Save : " + selection);
                        } else if (selection == JOptionPane.CANCEL_OPTION) {
                            // Code to use when CANCEL is PRESSED.
                            System.out.println("Selected Option Is CANCEL : " + selection);
                        }

                    }
                });

                // for file choose option................................
                JButton openButton;
                openButton = new JButton("Verify your DSC.");
                openButton.addActionListener(null);

            } catch (Exception e) {
                System.out.println("error to load file");
                e.printStackTrace();
            }

            buttonCance.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent actionEvent1) {
                    System.exit(0);
                }
            });

            // perform action on sign button
            buttonSaveDsc.addActionListener(new ActionListener() {

                public void actionPerformed(ActionEvent actionEvent) {

                    try {
                        java.io.InputStream instr = null;
                        int i = jTable1.getSelectedRow();
                        Map<String, String> map = new HashMap<String, String>();
                        String filedir = null;
                        if (i == -1) {
                            JOptionPane.showMessageDialog(frame, "Please select the DSC Certificate !!!");
                        } else {
                            s = jTable1.getValueAt(i, 0).toString() + " " + jTable1.getValueAt(i, 4).toString();
                            String DSCSerial = jTable1.getValueAt(i, 4).toString();
                            System.out.println("value of s is>>>>>>>>>>>>>>>" + DSCSerial + "s" + s + "passed dsc" + dscSerialNo);

                            try {
                                if (dscSerialNo.equals(DSCSerial)) {

                                    //String pathOfFile = basicService.getCodeBase() + "com.eproc.tender.pages/SignedPDF/" + tender_no + tender_id + "_approval" + ".pdf";

                                   // System.out.println("-------------pathOfFile ---> " + pathOfFile);
//                                    URL url = new URL(pathOfFile);
//                                    URLConnection openConnection = url.openConnection();
//                                    DataInputStream dis = new DataInputStream(openConnection.getInputStream());
//                                    PdfReader reader = new PdfReader(dis);
//                                    System.out.println("length " + reader.getFileLength());
//                                    System.out.println("1 id" + idJson);
                                    ks = KeyStore.getInstance("Windows-MY");
                                    ks.load(null, null);
                                    Enumeration en = ks.aliases();
                                    while (en.hasMoreElements()) {
                                        if (dscSerialNo.equals(DSCSerial)) {
                                            System.out.println("dscSerialNo: " + dscSerialNo + " DSCSerial: " + DSCSerial);
                                            System.out.println("allow");
                                            String alias = en.nextElement().toString();
                                            X509Certificate c = (X509Certificate) ks.getCertificate(alias);
                                            String serialNumber = c.getSerialNumber().toString();
                                            if (DSCSerial.equalsIgnoreCase(serialNumber)) {
//                                            URL url1 = new URL(basicService.getCodeBase(), "Tender.jpg");
//                                            System.out.println("url is.." + url.toString());
//                                            HttpURLConnection connection = (HttpURLConnection) url1.openConnection();
//                                            connection.setDoInput(true);
//                                            connection.setDoOutput(true);
//                                            connection.setUseCaches(false);
//                                            connection.setDefaultUseCaches(false);
//                                            connection.setRequestProperty("Content-Type", "application/octet-stream");
//                                            connection.setRequestProperty("Cookie", "tender_no=" + tender_no + ";tender_id=" + tender_id);
//                                            connection.setRequestMethod("POST");
//                                            java.io.OutputStream outstream = connection.getOutputStream();
//                                            String alias = en.nextElement().toString();
//                                            X509Certificate c = (X509Certificate) ks.getCertificate(alias);
//                                            String serialNumber = c.getSerialNumber().toString();
//                                            if (DSCSerial.equalsIgnoreCase(serialNumber)) {
//                                                map.put("aliasName", alias);
//                                                map.put("serialNo", serialNumber);
//                                                map.put("expiryDate", c.getNotAfter().toString());
//                                                PublicKey pk = (PublicKey) c.getPublicKey();
//                                                String public_key = new BASE64Encoder().encode(pk.getEncoded());
//                                                map.put("publicKey", public_key);
//
//                                                PrivateKey key = (PrivateKey) ks.getKey(alias, null);
//                                                Certificate[] chain = ks.getCertificateChain(alias);
//                                                DataOutputStream fout = new DataOutputStream(outstream);
//
//                                                PdfStamper stp = PdfStamper.createSignature(reader, fout, '\0');
//                                                PdfSignatureAppearance sap = stp.getSignatureAppearance();
//                                                sap.setCrypto(key, chain, null, PdfSignatureAppearance.WINCER_SIGNED);
//                                                sap.setLocation("200");
//                                                sap.setSignDate(Calendar.getInstance());
//                                                //comment next line to have an invisible signature
//                                                sap.setVisibleSignature(new Rectangle(100, 50, 200, 200), reader.getNumberOfPages(), null);
//                                                stp.close();
//                                                fout.close();
//
//                                                // receive result from servlet
//                                                instr = connection.getInputStream();
//                                                ObjectInputStream inputFromServlet = new ObjectInputStream(instr);
//                                                String result = (String) inputFromServlet.readObject();
//                                                inputFromServlet.close();
//                                                instr.close();
//                                                System.out.println(result);

                                                String basePath = basicService.getCodeBase() + "ApproveTender.action?tender_id=" + tender_id + "&tender_no=" + tender_no;
                                                URL url2 = new URL(basePath);
                                                System.out.println("basepath is: " + basePath);

                                                // save jnlp status
                                                testJnlp.saveJnlpStatus(url2.toString());
                                                 JOptionPane.showMessageDialog(null, actionMessage);
                                                 frame.dispose();
                                                break;
                                            } else {
                                                System.out.println("DSCSerial " + DSCSerial);
                                                System.out.println("dscSerialNo " + dscSerialNo);
                                                //break;
                                            }
                                        } else {
                                            JOptionPane.showMessageDialog(frame, "DSC Certificate is Mismatch , Please Select right one.... !!!");
                                        }
                                    }// end of while

                                } else {
                                    JOptionPane.showMessageDialog(frame, "DSC Certificate is Mismatch , Please Select right one.... !!!");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();

                    }
                }
            });

            frame.add(jTable1.getTableHeader(), BorderLayout.NORTH);
            frame.add(jTable1, BorderLayout.CENTER);
            frame.add(btnPnl, BorderLayout.SOUTH);

            frame.setSize(500, 312);
            frame.setVisible(true);

        } else if (osName != null && (osName.contains("Linux") || osName.contains("Mac"))) { /// JNLP code runs for Linux

            // read a properties file and create Map with key and value
            // code for searching a file  
            try {
                URL url = null;

                if (status != null && "active".equals(status)) {
                    JOptionPane.showMessageDialog(null, "You can not proceed again from here. Please go to website link to proceed again!!");
                    return;
                }

                if (osName.contains("Linux")) {
                    System.out.println("comes in linux");
                    url = new URL(basicService.getCodeBase() + linuxDriverLocationFileName);
                }
                if (osName.contains("Mac")) {
                    System.out.println("comes in mac");
                    url = new URL(basicService.getCodeBase() + macDriverLocationFileName);
                }

                prop.load(url.openStream());

                try {
                    for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                        if ("Nimbus".equals(info.getName())) {
                            javax.swing.UIManager.setLookAndFeel(info.getClassName());
                            break;
                        }
                    }
                    System.out.println("In createTokenFrame....");
                } catch (ClassNotFoundException ex) {
                    java.util.logging.Logger.getLogger(TokenFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                } catch (InstantiationException ex) {
                    java.util.logging.Logger.getLogger(TokenFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                } catch (IllegalAccessException ex) {
                    java.util.logging.Logger.getLogger(TokenFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                } catch (javax.swing.UnsupportedLookAndFeelException ex) {
                    java.util.logging.Logger.getLogger(TokenFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
                }

                java.awt.EventQueue.invokeLater(new Runnable() {

                    public void run() {
                        tokenFrame = new TokenFrame();
                        tokenFrame.populateCombo(prop);
                        tokenFrame.setVisible(true);

                        tokenFrame.tokenNameLocationComboBox.addActionListener(new java.awt.event.ActionListener() {

                            public void actionPerformed(java.awt.event.ActionEvent evt) {
                                tokenLocationComboActionPerformed(evt);
                            }

                            private void tokenLocationComboActionPerformed(java.awt.event.ActionEvent evt) {
                                String selectedKey = null;
                                tokenFrame.tokenNameLocationComboBox.setSize(new Dimension(tokenFrame.tokenNameLocationComboBox.getWidth(), tokenFrame.tokenNameLocationComboBox.getHeight()));
                                if (tokenFrame.tokenNameLocationComboBox.getSelectedItem() != null) {
                                    selectedKey = tokenFrame.tokenNameLocationComboBox.getSelectedItem().toString();
                                    for (Map.Entry<String, String> entry : tokenFrame.tokenLocationMap.entrySet()) {
                                        if (entry.getKey().equalsIgnoreCase(selectedKey)) {
                                            tokenFrame.selectedToken = entry.getValue();
                                            if (!entry.getKey().equalsIgnoreCase("Select")) {
                                                tokenFrame.proceedButton.setEnabled(true);
                                            } else {
                                                tokenFrame.proceedButton.setEnabled(false);
                                            }
                                            if (entry.getKey().equalsIgnoreCase("Other")) {
                                                tokenFrame.selectedToken = tokenFrame.otherTextField.getText();
                                                tokenFrame.otherPanel.setVisible(true);
                                            } else {
                                                tokenFrame.otherPanel.setVisible(false);
                                            }
                                        }
                                    }
                                }
                            }
                        }); // combo box action listener end

                        tokenFrame.proceedButton.addActionListener(new java.awt.event.ActionListener() {

                            public void actionPerformed(java.awt.event.ActionEvent evt) {
                                try {
                                    proceedButtonActionPerformed(evt);
                                } catch (URISyntaxException ex) {
                                    //Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }

                            private void proceedButtonActionPerformed(java.awt.event.ActionEvent evt) throws URISyntaxException {
                                pkcs11Config = tokenFrame.selectedToken;
                                if ("".equals(pkcs11Config)) {
                                    JOptionPane.showMessageDialog(null, "Please select any token or enter library path");
                                    return;
                                }
                                System.out.println("selected token library path is: " + pkcs11Config);
                                String filePathOnly = null;
                                String arr[] = pkcs11Config.split("=");
                                for (String ar : arr) {
                                    filePathOnly = ar;
                                }
                                System.out.println("String filePathOnly: " + filePathOnly);
                                // search file exists or not
                                File f = new File(filePathOnly);
                                System.out.println("library file path exists? " + f.exists());
                                if (f.exists()) {
                                    // register correct provider for pkcs11
                                    try {
                                        ByteArrayInputStream configStream = new ByteArrayInputStream(pkcs11Config.getBytes());
                                        pkcs11Provider = new sun.security.pkcs11.SunPKCS11(configStream);
                                        Security.removeProvider(pkcs11Provider.getName());
                                        Security.addProvider(pkcs11Provider);
                                    } catch (Exception e) {
                                        handlePasswordCallback("Please select correct token or enter correct token library path");
                                        e.printStackTrace();
                                        return;
                                    }

                                    boolean flag = getKeyStore();
                                    if (flag) {
                                        JOptionPane.showMessageDialog(null, "Login successfully!!");
                                        // after getting successfull keystore                                        
                                        try {

                                            String pathOfFile = basicService.getCodeBase() + "com.eproc.tender.pages/SignedPDF/" + tender_no + tender_id + "_approval" + ".pdf";
                                            System.out.println("-------------pathOfFile ---> " + pathOfFile);
                                            URL url = new URL(pathOfFile);
                                            URLConnection openConnection = url.openConnection();
                                            DataInputStream dis = new DataInputStream(openConnection.getInputStream());
                                            PdfReader reader = new PdfReader(dis);
                                            boolean serialNoCheck = false;
                                            Enumeration en = ks.aliases();
                                            while (en.hasMoreElements()) {
                                                String alias = en.nextElement().toString();
                                                X509Certificate c = (X509Certificate) ks.getCertificate(alias);
                                                Principal subjectDN = c.getSubjectDN();
                                                String IssuedTo = getIssuedTo(subjectDN.getName());
                                                System.out.println("issued to is: " + IssuedTo);
                                                String serialNo = c.getSerialNumber().toString();
                                                System.out.println("certificate serial no: " + serialNo);
                                                if (basicService != null && dscSerialNo.equals(serialNo)) {
                                                    URL url1 = new URL(basicService.getCodeBase(), "Tender.jpg");
                                                    HttpURLConnection connection = (HttpURLConnection) url1.openConnection();
                                                    connection.setDoInput(true);
                                                    connection.setDoOutput(true);
                                                    connection.setUseCaches(false);
                                                    connection.setDefaultUseCaches(false);
                                                    connection.setRequestProperty("Content-Type", "application/octet-stream");
                                                    connection.setRequestProperty("Cookie", "tender_no=" + tender_no + ";tender_id=" + tender_id);
                                                    connection.setRequestMethod("POST");
                                                    OutputStream outstream = connection.getOutputStream();

                                                    PrivateKey key = (PrivateKey) ks.getKey(alias, null);
                                                    Certificate[] chain = ks.getCertificateChain(alias);
                                                    DataOutputStream fout = new DataOutputStream(outstream);

                                                    PdfStamper stp = PdfStamper.createSignature(reader, fout, '\0');
                                                    PdfSignatureAppearance sap = stp.getSignatureAppearance();
                                                    sap.setCrypto(key, chain, null, PdfSignatureAppearance.WINCER_SIGNED);
                                                    sap.setLocation("Test");
                                                    sap.setSignDate(Calendar.getInstance());
                                                    sap.setVisibleSignature(new Rectangle(100, 50, 200, 200), reader.getNumberOfPages(), null);
                                                    stp.close();
                                                    fout.close();

                                                    InputStream instr = connection.getInputStream();
                                                    ObjectInputStream inputFromServlet = new ObjectInputStream(instr);
                                                    inputFromServlet.readObject();
                                                    inputFromServlet.close();
                                                    instr.close();

                                                    String basePath = basicService.getCodeBase() + "ApproveTender.action?tender_id=" + tender_id + "&tender_no=" + tender_no;
                                                    URL url2 = new URL(basePath);
                                                    System.out.println(url2);

                                                    // save jnlp status
                                                    testJnlp.saveJnlpStatus(url2.toString());
                                                    break;
                                                }
                                            }// end of while
                                            if (!serialNoCheck) {
                                                JOptionPane.showMessageDialog(null, "You are not allowed. Serial No not matched!!");
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            tokenFrame.dispose();
                                        }
                                    } else {
                                        JOptionPane.showMessageDialog(null, "Login failed!!");
                                    }
                                } else {
                                    JPanel panel = new JPanel();
                                    Object[] options1 = {"OK"};
                                    final URI uri = new URI("http://java.sun.com");

                                    class OpenUrlAction implements ActionListener {

                                        @Override
                                        public void actionPerformed(ActionEvent e) {
                                            open(uri);
                                        }
                                    }

                                    panel.add(new JLabel("<html>Seleted token file does not found. <br> Please try below link to download corresponding driver file and instruction manual to install driver.<br></html>"));
                                    JButton button = getURIButton(uri);
                                    button.addActionListener(new OpenUrlAction());
                                    panel.add(button);
                                    JOptionPane.showOptionDialog(null, panel, "Message", JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE,
                                            null, options1, null);
                                }
                            }
                        }); // proceed button action listener end                        

                        tokenFrame.otherTextField.getDocument().addDocumentListener(new DocumentListener() {
                            public void changedUpdate(DocumentEvent evt) {
                                otherTextFieldActionPerformed(evt);
                            }

                            public void removeUpdate(DocumentEvent evt) {
                                otherTextFieldActionPerformed(evt);
                            }

                            public void insertUpdate(DocumentEvent evt) {
                                otherTextFieldActionPerformed(evt);
                            }

                            private void otherTextFieldActionPerformed(javax.swing.event.DocumentEvent evt) {
                                tokenFrame.selectedToken = tokenFrame.otherTextField.getText();
                            }
                        }); // other text field document listener end

                        tokenFrame.browseButton.addActionListener(new java.awt.event.ActionListener() {

                            public void actionPerformed(java.awt.event.ActionEvent evt) {
                                browseButtonActionPerformed(evt);
                            }

                            private void browseButtonActionPerformed(java.awt.event.ActionEvent evt) {

                                JFileChooser fileChooser = new JFileChooser();
                                fileChooser.setAcceptAllFileFilterUsed(false);
                                int closeOption = fileChooser.showOpenDialog(tokenFrame);
                                if (closeOption == JFileChooser.APPROVE_OPTION) {
                                    File file = fileChooser.getSelectedFile();
                                    if (file != null) {
                                        String filePath = file.getPath();
                                        tokenFrame.otherTextField.setText(filePath);
                                    }
                                }
                                tokenFrame.selectedToken = tokenFrame.otherTextField.getText();
                            }
                        }); // browse button action listener end 
                    }
                });
            } catch (IOException ioe) {
                System.out.println("error in reading file");
                ioe.printStackTrace();
            } catch (Exception e) {
                System.out.println("File not exist");
                e.printStackTrace();
            }
            // end of reading properties file

        }

    }

    private static void open(URI uri) {
        if (Desktop.isDesktopSupported()) {
            try {
                Desktop.getDesktop().browse(uri);
            } catch (IOException e) {
            }
        } else {
        }
    }

    public static JButton getURIButton(URI uri) {
        JButton button = new JButton();
        button.setText("<HTML>Click here to download driver</HTML>");
        button.setHorizontalAlignment(SwingConstants.LEFT);
        button.setBorderPainted(false);
        button.setOpaque(false);
        button.setToolTipText(uri.toString());
        return button;
    }

    public static boolean getKeyStore() {
        boolean flag = false;
        // get keystore using pkcs11
        try {
            AuthProvider pkcs11Prov = (AuthProvider) pkcs11Provider;
            CallbackHandler cbh = new SwingPasswordCallbackHandler(); //explicit login
            KeyStore.CallbackHandlerProtection pwCallbackProt = new KeyStore.CallbackHandlerProtection(cbh);
            KeyStore.Builder builder = KeyStore.Builder.newInstance("PKCS11", pkcs11Prov, pwCallbackProt);
            ks = builder.getKeyStore();
            flag = true;
        } catch (KeyStoreException e) {
            Object[] options1 = {"Continue", "Cancel"};
            JPanel panel = new JPanel();
            panel.add(new JLabel("Wrong Password OR Insert Token Properly!!"));
            int result = JOptionPane.showOptionDialog(null, panel, "Message", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE,
                    null, options1, null);
            if (result == JOptionPane.YES_OPTION) {
                flag = getKeyStore();
            }
            e.printStackTrace();
        }
        return flag;
    }

    private static void handlePasswordCallback(String msg) {
        // dialog
        try {
            JPanel panel = new JPanel();
            panel.setLayout(new GridLayout(2, 1));
            final JTextField txtPwd = new JPasswordField(20);
            panel.add(txtPwd);
            final JOptionPane pane = new JOptionPane(msg);
            JDialog dialog = pane.createDialog("Title");
            // set focus to password field
            dialog.addWindowListener(new WindowAdapter() {
                @Override
                public void windowOpened(WindowEvent e) {
                    txtPwd.requestFocusInWindow();
                }
            });
            // show dialog
            dialog.setVisible(true);
            dialog.dispose();
            int retVal = pane.getValue() != null ? ((Integer) pane.getValue()).intValue() : JOptionPane.CANCEL_OPTION;
            switch (retVal) {
                case JOptionPane.OK_OPTION:
                    break;
                default:
                    // canceled by user
                    throw new CancellationException("Password Callback canceled by user");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getIssuedTo(String name) {
        LdapName ldapName = null;
        String issuedTo = null;
        try {
            ldapName = new LdapName(name);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        for (Rdn rdn : ldapName.getRdns()) {
            String type = rdn.getType();
            if ("CN".equals(type)) {
                issuedTo = (String) rdn.getValue();
            }
        }
        return issuedTo;
    }

    private void readData(String args[]) {
        JsonParser parser = new JsonParser();

        if (args.length > 0) {
            for (int i = 0; i < args.length; i++) {
                JsonElement rootElement = parser.parse(args[i]);
                if (rootElement.isJsonObject()) {
                    idJson = rootElement.getAsJsonObject().get("jsonId").getAsString();
                    tender_id = Integer.parseInt(rootElement.getAsJsonObject().get("tender_id").getAsString());
                    tender_no = Integer.parseInt(rootElement.getAsJsonObject().get("tender_no").getAsString());
                    dscSerialNo = rootElement.getAsJsonObject().get("dscSerialNo").getAsString();
                    browser = rootElement.getAsJsonObject().get("browser").getAsString();
                    departmentUserId = rootElement.getAsJsonObject().get("departmentUserId").getAsString();
                    randomNo = rootElement.getAsJsonObject().get("randomNo").getAsString();
                    deptClass2 = rootElement.getAsJsonObject().get("deptclass2").getAsString();
                    deptClass3 = rootElement.getAsJsonObject().get("deptclass3").getAsString();
                    actionMessage = rootElement.getAsJsonObject().get("actionMessage").getAsString();

                    System.out.println("actionMessage ------------------- : "+actionMessage);
                    System.out.println("value of tender id no and json id is" + idJson + " " + tender_no + "tenderID" + tender_id + "dscSeralno" + dscSerialNo + "departmentUserId" + departmentUserId + "randomNo" + randomNo);
                }
            }
        }
    }

    private void setCodeBase() {
        PersistenceService persistenceService = null;
        try {
            persistenceService = (PersistenceService) ServiceManager.lookup("javax.jnlp.PersistenceService");
            basicService = (BasicService) ServiceManager.lookup("javax.jnlp.BasicService");
            if (persistenceService != null) {
                codebase = basicService.getCodeBase();
            }
            System.out.println("code base is: " + basicService.getCodeBase());
        } catch (UnavailableServiceException ef) {
            persistenceService = null;
            basicService = null;
        }
    }

    public static String chooseBrowser(Properties prop, String browser) {
        String actualBrowser = null;
        Set<String> propertySet;
        if (prop != null) {
            propertySet = prop.stringPropertyNames();
            System.out.println("Inside chooseBrowser()...." + propertySet);
            if (propertySet != null) {
                String propValue = null;
                String propKey = null;
                Iterator it = propertySet.iterator();
                while (it.hasNext()) {
                    propKey = (String) it.next();
                    propValue = prop.getProperty(propKey);
                    if (browser.equals(propKey)) {
                        actualBrowser = propValue;
                    }
                }
            }
        }
        System.out.println("actual browser: " + actualBrowser);
        return actualBrowser;
    }

    public String accessJnlpStatus() {
        String status = null;
        ObjectInputStream inputFromServlet = null;

        // access jnlp status
        try {
            URL url1 = new URL(testJnlp.codebase, "AccessJnlpStatus.JPG");
            HttpURLConnection connection = (HttpURLConnection) url1.openConnection();
            connection.setDoInput(true);
            connection.setDoOutput(false);
            connection.setUseCaches(false);
            connection.setDefaultUseCaches(false);
            connection.setRequestProperty("Content-Type", "application/octet-stream");
            connection.setRequestProperty("Cookie", "tenderId=" + tender_id + ";departmentUserId=" + departmentUserId + ";randomNo=" + randomNo);
            connection.setRequestMethod("GET");
            connection.connect();

            //Recieve response from servlet
            InputStream instr = connection.getInputStream();
            try {
                // getting jnlp status data from servlet
                inputFromServlet = new ObjectInputStream(instr);
                if (inputFromServlet != null) {
                    status = (String) inputFromServlet.readObject();
                }
                System.out.println("return status is: " + status);
                instr.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public String saveJnlpStatus(String url) {

        String status = null;
        ObjectInputStream inputFromServlet = null;
        Map<String, String> map = new HashMap<String, String>();

        // save jnlp status
        try {
            url = new Gson().toJson(url);
            System.out.println("encoded url is: " + url);
            map.put("url", url);

            URL url1 = new URL(codebase, "SaveJnlpStatus.JPG");
            HttpURLConnection connection = (HttpURLConnection) url1.openConnection();
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            connection.setDefaultUseCaches(false);
            connection.setRequestProperty("Content-Type", "application/octet-stream");
            connection.setRequestProperty("Cookie", "tenderId=" + tender_id + ";departmentUserId=" + departmentUserId + ";randomNo=" + randomNo);
            connection.setRequestMethod("POST");
            OutputStream outstream = connection.getOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(outstream);
            out.writeObject(map);
            out.flush();
            out.close();

            //Recieve response from servlet
            InputStream instr = connection.getInputStream();
            try {
                // getting response data from servlet
                inputFromServlet = new ObjectInputStream(instr);
                if (inputFromServlet != null) {
                    status = (String) inputFromServlet.readObject();
                }
                System.out.println("return status is: " + status);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Check Department User DSC Type{Class 2 (SIGNING or ENCRYPTION)} here
    public static boolean isClass2(X509Certificate cert) {

        dt = 0;
        boolean s = false;

        Principal issuerDN = cert.getIssuerDN();
        String name = issuerDN.getName();
        System.out.println(name);
        if (s != true) {
            s = name.contains("Class 2");
        }
        System.out.println("Department allow DSC Class Type is : " + departmentAllowedDSCType);

        System.out.println("department allow DSC Type is : " + dscType);
        System.out.println("Dsc attribute value is  : " + dt);

        boolean status = false;
        int index = -1;
        try {

            boolean[] keyUsage = cert.getKeyUsage();

            if(s){
            for (int k = 0; k < keyUsage.length; k++) {
                // check usage criteria

                if (k == dt && keyUsage[dt]) {
                    status = true;
                    System.out.println("Signing");
                }
            }
        }
            System.out.println("-------------- final status --------------  : " + status);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;

    }
     public static String getCommonName(Principal principal) {
        String commonName = "";
        if (principal != null) {
            String data = principal.getName();
            if (data.contains(",")) {
                String a[] = data.split(",");
                if (a[0].contains("=")) {
                    String b[] = a[0].split("=");
                    commonName = b[1];
                }

            }
        }
        return commonName;
    }

}

// TokenFrame java class
class TokenFrame extends javax.swing.JFrame {

    private Set<String> propertySet;
    Map<String, String> tokenLocationMap = new HashMap<String, String>();
    String selectedToken;

    public Set<String> getPropertySet() {
        return propertySet;
    }

    public void setPropertySet(Set<String> propertySet) {
        this.propertySet = propertySet;
    }

    public TokenFrame() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        tokenComboPanel = new javax.swing.JPanel();
        tokenLabel = new javax.swing.JLabel();
        tokenNameLocationComboBox = new javax.swing.JComboBox();
        otherPanel = new javax.swing.JPanel();
        otherTextField = new javax.swing.JTextField();
        browseButton = new javax.swing.JButton();
        proceedButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tokenLabel.setText("Select Token");

        //tokenNameLocationComboBox.setModel(new javax.swing.DefaultComboBoxModel(new String[] { }));
        javax.swing.GroupLayout tokenComboPanelLayout = new javax.swing.GroupLayout(tokenComboPanel);
        tokenComboPanel.setLayout(tokenComboPanelLayout);
        tokenComboPanelLayout.setHorizontalGroup(
                tokenComboPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(tokenComboPanelLayout.createSequentialGroup().addGap(31, 31, 31).addComponent(tokenLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 114, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(37, 37, 37).addComponent(tokenNameLocationComboBox, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE).addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        tokenComboPanelLayout.setVerticalGroup(
                tokenComboPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(tokenComboPanelLayout.createSequentialGroup().addContainerGap().addGroup(tokenComboPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(tokenLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(tokenNameLocationComboBox, javax.swing.GroupLayout.DEFAULT_SIZE, 30, Short.MAX_VALUE)).addContainerGap()));

        browseButton.setText("Browse");

        javax.swing.GroupLayout otherPanelLayout = new javax.swing.GroupLayout(otherPanel);
        otherPanel.setLayout(otherPanelLayout);
        otherPanelLayout.setHorizontalGroup(
                otherPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(otherPanelLayout.createSequentialGroup().addContainerGap().addComponent(otherTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 254, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(18, 18, 18).addComponent(browseButton).addContainerGap(31, Short.MAX_VALUE)));
        otherPanelLayout.setVerticalGroup(
                otherPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(javax.swing.GroupLayout.Alignment.TRAILING, otherPanelLayout.createSequentialGroup().addGap(0, 0, Short.MAX_VALUE).addGroup(otherPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE).addComponent(otherTextField, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE).addComponent(browseButton))));

        proceedButton.setText("Proceed");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addContainerGap().addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addComponent(tokenComboPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE).addComponent(otherPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))).addGroup(layout.createSequentialGroup().addGap(141, 141, 141).addComponent(proceedButton).addGap(0, 0, Short.MAX_VALUE))).addContainerGap()));
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(layout.createSequentialGroup().addGap(29, 29, 29).addComponent(tokenComboPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(18, 18, 18).addComponent(otherPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE).addGap(32, 32, 32).addComponent(proceedButton).addContainerGap(104, Short.MAX_VALUE)));

        tokenNameLocationComboBox.setToolTipText("location of signature");
        proceedButton.setToolTipText("Proceed");
        otherTextField.setToolTipText("Enter library path.....");
        proceedButton.setEnabled(false);
        otherPanel.setVisible(false);
        setSize(400, 250);
        //pack();
        System.out.println("In last of constructor()....");
    }// </editor-fold>

    public void populateCombo(Properties prop) {
        if (prop != null) {
            propertySet = prop.stringPropertyNames();
            System.out.println("Inside createPanel()...." + propertySet);
            if (propertySet != null) {
                String propValue = null;
                String propKey = null;
                Iterator it = propertySet.iterator();
                while (it.hasNext()) {
                    propKey = (String) it.next();
                    propValue = prop.getProperty(propKey);
                    tokenLocationMap.put(propKey, propValue);
                }

            }
            tokenNameLocationComboBox.addItem("Select");
            for (Map.Entry<String, String> entry : tokenLocationMap.entrySet()) {
                tokenNameLocationComboBox.addItem(entry.getKey());
            }
            tokenLocationMap.put("Select", "Select");
            tokenLocationMap.put("Other", "Other");
            tokenNameLocationComboBox.addItem("Other");
            tokenNameLocationComboBox.setSelectedItem("Select");

        }

    }
    // Variables declaration - do not modify
    javax.swing.JButton browseButton;
    javax.swing.JPanel otherPanel;
    javax.swing.JTextField otherTextField;
    javax.swing.JButton proceedButton;
    javax.swing.JPanel tokenComboPanel;
    javax.swing.JLabel tokenLabel;
    javax.swing.JComboBox tokenNameLocationComboBox;
    // End of variables declaration

}// end of TokenFrame java class
